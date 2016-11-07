class EventsController < ApplicationController
  # def index
  #   @charity = Charity.find(params[:charity_id])
  #   @events = @charity.events
  # end

  def show
    @charity = Charity.find(params[:charity_id])
    @event = Event.find(params[:id])
  end
end

