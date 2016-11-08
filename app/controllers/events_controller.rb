class EventsController < ApplicationController
  def show
    @charity = Charity.find(params[:charity_id])
    @event = Event.find(params[:id])
  end
end

