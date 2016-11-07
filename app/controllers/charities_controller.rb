class CharitiesController < ApplicationController
  def index
    @results = Charity.within(0.8, origin: params[:search])
    @location = geocode_address(params[:search])
  end

  def show
    @charity = Charity.find(params[:id])
    @events = @charity.events
    @needs = @charity.needs
    @giver = current_giver
    # check if current_giver has a subscription record
    # active record association obj vs active record obj

  end

  private

  def geocode_address(address)
    geo = Geokit::Geocoders::MultiGeocoder.geocode(address)
    [geo.lat, geo.lng]
  end
end
