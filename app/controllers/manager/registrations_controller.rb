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
    # after manager clicks "approve":
    # add pending_hours to approved_hours
    # update user points
    # close modal with js
    redirect_to '/'
  end

  def destroy
     # after manager clicks "deny":
     # destroy registration object
     # close modal with js
     redirect_to '/'
  end
end
