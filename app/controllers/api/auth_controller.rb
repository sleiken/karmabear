class Api::AuthController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authorize_user, only: [:giver_profile]
  respond_to :json
  Dotenv.load

  def giver_profile
    giver = Giver.find_by(1)
    charities = giver.followed_charities
    events = giver.events
    needs = giver.needs

    response_json = {giver: giver, charities: charities, events: events, needs: needs}.to_json

    render :json => JSON.pretty_generate(JSON.parse(response_json))
  end

  def verify
    render status: :forbidden unless params[:id]

    response = HTTParty.get("https://graph.facebook.com/v2.8/#{params[:id]}?fields=first_name,last_name,email,picture&access_token=#{params[:access_token]}")

    data = JSON.parse(response.body)
    user = Giver.from_mobile_omniauth(data)

    render :json => JSON.pretty_generate(JSON.parse(generate_token(user).to_json))
  end

  def test
    params[:token] = generate_token(Giver.first)
    decoded = decode_token(token)
    p token
    decoded = decoded[0]['user']
    render :json => "#{Giver.find_by(username: decoded).email}"
  end

  private

  def authorize_user
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
