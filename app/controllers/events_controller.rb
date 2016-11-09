class EventsController < ApplicationController
  def show
    @charity = Charity.find(params[:charity_id])
    @event = Event.find(params[:id])
    @giver = current_giver
    @registration = @event.registrations.find_or_create_by(giver_id: @giver)
  end
end

