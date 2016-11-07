class Api::ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authorize_user, only: [:giver_profile]
  respond_to :json
  Dotenv.load

  def search
    results = Charity.within(0.8, origin: params[:search])
    # location = geocode_address(params[:search])
    render :json => JSON.pretty_generate(JSON.parse(results.to_json))
  end

  def charities
    render :json => JSON.pretty_generate(JSON.parse(Charity.all.to_json))
  end

  def test
    response = HTTParty.get("https://www.facebook.com/v2.8/dialog/oauth?client_id=1818252068416496&response_type=token&redirect_uri=https://www.facebook.com/connect/login_success.html")
    render :json => response
  end

  def giver_profile
    giver = Giver.find(1)
    charities = giver.followed_charities.to_json
    events = giver.events.to_json
    needs = giver.needs.to_json

    response_json = "[#{giver.to_json}, #{charities}, #{events}, #{needs}]"

    render :json => JSON.pretty_generate(JSON.parse(response_json))
  end

  private

  def geocode_address(address)
    geo = Geokit::Geocoders::MultiGeocoder.geocode(address)
    [geo.lat, geo.lng]
  end

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
