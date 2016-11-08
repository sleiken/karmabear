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

  def edit
    @registration = Registration.find(params[:id])
  end

  def update
    @registration = Registration.find(params[:id])
    @registration.update(registration_params)

    if @registration.save
      redirect_to charity_event_url(@charity, @event)
    else
      @errors = @registration.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @registration = Registration.find(params[:id])
    @registration.destroy!
    @event.givers_needed += 1
    @event.save!


    redirect_to charity_event_url(@charity, @event)
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
