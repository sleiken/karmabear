class Api::AuthController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authorize_user, only: [:giver_profile]
  respond_to :json
  Dotenv.load

  def giver_profile
    giver = Giver.find(1)
    charities = giver.followed_charities
    events = giver.events
    needs = giver.needs

    response_json = {giver: giver, charities: charities, events: events, needs: needs}.to_json

    render :json => JSON.pretty_generate(JSON.parse(response_json))
  end

  def test
    render :json => verify_access_token
  end

  private

  def authorize_user
    # begin
    #   decode_token(token)
    # rescue JWT::VerificationError
    #   # Handle Signature verification raised error
    # rescue JWT::ExpiredSignature
    #   # Handle expired token, e.g. logout user or deny access
    # end
    token = generate_token(Giver.find_by(username: "samleiken"))
    p token
    p decode_token(token)
  end

  # Used to verify access token passed from FB OAuth server to iOS
  def verify_access_token
    # render status: :forbidden unless params[:token]
    #
    # token = params[:token]
    response = HTTParty.get("https://graph.facebook.com/me/?access_token=EAAZA1sMymaZCABAAHVzjORg1UkkrBhmDQyoBVZA5HVEBJmOWZANjDgT0EvqSkNEyu5U0WKq3IJ8WZBkni7jaxyOjx1nZBqvJiLQ05JztuaEZC6O0thRqgazm8hjPY0Fuj6z9GquZAeft86OKLEkBShuexmzzPfKByiZBeFC28WS5B7QZDZD")

    if response.code == 200
      data = JSON.parse(response.body)
      # User.
    end
    # user
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
