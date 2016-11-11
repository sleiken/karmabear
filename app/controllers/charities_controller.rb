class CharitiesController < ApplicationController
  Dotenv.load

  def index
    @results = Charity.within(0.8, origin: params[:search])
    @location = geocode_address(params[:search])
    @giver = current_giver
  end

  def show
    @charity = Charity.find(params[:id])
    @events = @charity.events
    @needs = @charity.needs
    @giver = current_giver
    @subscription = @charity.subscriptions.find_by(giver_id: @giver)
  end

  private

  def geocode_address(address)
    Geokit::Geocoders::GoogleGeocoder.api_key = ENV['GOOGLE_GEOCODER_KEY']
    geo = Geokit::Geocoders::GoogleGeocoder.geocode(address)
    [geo.lat, geo.lng]
  end
end
