class CharitiesController < ApplicationController
  def index
    @charities = Charity.all
    @results = Charity.within(2, origin: params[:search])
    @search = params[:search]
  end

  def show
    @charity = Charity.find(params[:id])
    @events = @charity.events
    @needs = @charity.needs
  end
end
