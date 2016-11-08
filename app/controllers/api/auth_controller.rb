class Api::AuthController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :verify_token, only: [:giver_profile]
  respond_to :json
  Dotenv.load

  def giver_profile
    render status: :forbidden unless params[:token]

    giver = Giver.find_by(@token_payload[0]['user'])
    charities = giver.followed_charities
    events = giver.events
    needs = giver.needs

    response_json = {giver: giver, charities: charities, events: events, needs: needs}.to_json

    render :json => JSON.pretty_generate(JSON.parse(response_json))
  end

  def verify
    response = HTTParty.get("https://graph.facebook.com/v2.8/#{params[:id]}?fields=first_name,last_name,email,picture&access_token=#{params[:access_token]}")

    data = JSON.parse(response.body)
    user = Giver.from_mobile_omniauth(data)

    render :json => JSON.pretty_generate(JSON.parse(generate_token(user).to_json))
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
