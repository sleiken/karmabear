class RegistrationsController < ApplicationController
  before_action :find_charity
  before_action :find_event

  def new
    @registration = Registration.new
  end

  def create
    @registration = @event.registrations.new(registration_params)
    @registration.giver = current_giver

    if @registration.save
      # decrement the givers needed on the event show page
      @event.givers_needed -= 1
      @event.save!

      redirect_to charity_event_path(@charity, @event)
    else
      @errors = @registration.errors.full_messages
      render "new"
    end
  end

  def update
    #update pending hours
  end

  def destroy
    # delete registration record
  end

  private

  def registration_params
    params.require(:registration).permit(:pending_hours)
  end

  def find_charity
    @charity = Charity.find(params[:charity_id])
  end

  def find_event
    @event = Event.find(params[:event_id])
  end
end
