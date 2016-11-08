class Api::ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  respond_to :json
  Dotenv.load

  def search
    results = Charity.within(0.8, origin: params[:search])
    render :json => JSON.pretty_generate(JSON.parse(results.to_json))
  end

  def charities
    render :json => JSON.pretty_generate(JSON.parse(Charity.all.to_json))
  end

  private

  def geocode_address(address)
    Geokit::Geocoders::GoogleGeocoder.api_key = ENV['GOOGLE_GEOCODER_KEY']
    geo = Geokit::Geocoders::GoogleGeocoder.geocode(address)
    [geo.lat, geo.lng]
  end
end
