class Api::AuthController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :verify_token, only: [:giver, :follow, :charity]
  respond_to :json
  Dotenv.load

  def verify
    render status: :forbidden unless params[:access_token] && params[:id]

    response = HTTParty.get("https://graph.facebook.com/v2.8/#{params[:id]}?fields=first_name,last_name,email,picture&access_token=#{params[:access_token]}")

    data = JSON.parse(response.body)
    user = Giver.from_mobile_omniauth(data)

    render :json => JSON.pretty_generate(JSON.parse(generate_token(user).to_json))
  end

  def giver
    giver = Giver.find_by(username: @token_payload[0]['user'])
    charities = giver.followed_charities
    events = giver.events
    needs = giver.needs

    response_json = {giver: giver, charities: charities, events: events, needs: needs}.to_json

    render :json => JSON.pretty_generate(JSON.parse(response_json))
  end

  def charity
    giver = Giver.find_by(username: @token_payload[0]['user'])
    charity = Charity.find(params[:id])
    events = charity.events
    needs = charity.needs

    response_json = {charity: charity, events: events, needs: needs}.to_json

    render :json => JSON.pretty_generate(JSON.parse(response_json))
  end

  def follow
    giver = Giver.find_by(username: @token_payload[0]['user'])
    charity = Charity.find(params[:id])
    old_follow = Subscription.find_by(giver: giver, charity: charity)

    if old_follow
      old_follow.destroy
      response = "unfollowed".to_json
      render :json => JSON.pretty_generate(JSON.parse(response))
    else
      begin
        Subscription.create!(giver: giver, charity: charity)
      rescue ActiveRecord::RecordInvalid
        response = "error".to_json
        render :json => JSON.pretty_generate(JSON.parse(response))
      else
        response = "followed".to_json
        render :json => JSON.pretty_generate(JSON.parse(response))
      end
    end
  end

  def test
    params[:token] = generate_token(Giver.first)
    verify_token
    decoded = @token_payload[0]['user']
    render :json => "#{params[:token]}, #{Giver.find_by(username: decoded).email}"
  end

  private

  def verify_token
    render status: :forbidden unless params[:token]
    begin
      @token_payload = decode_token(params[:token])
    rescue JWT::VerificationError
      render status: :forbidden
    rescue JWT::ExpiredSignature
      render status: :forbidden
    end
  end

  def generate_token(user)
    exp = Time.now.to_i + 7 * 3600
    payload = { user: user.username, exp: exp }
    JWT.encode payload, ENV['AUTH_SECRET'], 'HS256'
  end

  def decode_token(token)
    JWT.decode token, ENV['AUTH_SECRET'], true, { :algorithm => 'HS256' }
  end
end
