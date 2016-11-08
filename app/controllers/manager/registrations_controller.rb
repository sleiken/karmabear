class Manager::RegistrationsController < Manager::ApplicationController
  def index

  end

  def show
    @registration = Registration.find(params[:id])
    @charity = Charity.find(params[:charity_id])
  end

  def update
    @registration = Registration.find(params[:id])
    @charity = Charity.find(params[:charity_id])
    @giver = @registration.giver

    # put this in a helper method!
    @registration.approved_hours = @registration.pending_hours
    @registration.pending_hours = 0

    @registration.save!
    # update user points
    # close modal with js
    # redirect for testing purposes:
    redirect_to manager_charity_url(@charity)
  end

  def destroy
    @registration = Registration.find(params[:id])
    @charity = Charity.find(params[:charity_id])
    @registration.destroy
     # after manager clicks "deny":
     # destroy registration object
     # close modal with js
    redirect_to manager_charity_url(@charity)
  end
end
