class Api::ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  respond_to :json

  def search
    results = Charity.within(0.8, origin: params[:search])
    # location = geocode_address(params[:search])
    render :json => JSON.pretty_generate(JSON.parse(results.to_json))
  end

  def charities
    render :json => JSON.pretty_generate(JSON.parse(Charity.all.to_json))
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
end
