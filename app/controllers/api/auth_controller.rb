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
    response = HTTParty.get("https://graph.facebook.com/me/?access_token=EAACEdEose0cBAK7ZBt4Qn38gsvyPG7zrPOaOAX4YSgfGiE1QXtMe6bw2gOSbpUShyGxPKM2hr46rEddN3VIZC6sxRQa8rsV1zI8kBiK4V9goW1ffEFL29dF43PTJNGeyd70L6TaeM0zZArpLLmPCQwiyZBtgT6KQPLPZCnVFDXQZDZD")
    render :json => response
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
    render status: :forbidden unless params[:token]

    token = params[:token]
    response = HTTParty.get("https://www.facebook.com/v2.8/dialog/oauth?client_id=1818252068416496&response_type=token&redirect_uri=https://www.facebook.com/connect/login_success.html")

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
