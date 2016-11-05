class EventsController < ApplicationController
  def index
    @charity = Charity.find(params[:charity_id])
    @events = @charity.events
  end

  def show
    @event = Event.find(param[:id])
  end
end

