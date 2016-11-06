class CharitiesController < ApplicationController
  def index
    @charities = Charity.all
  end

  def show
    @charity = Charity.find(params[:id])
    @events = @charity.events
    @needs = @charity.needs
  end
end