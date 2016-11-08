class Manager::RegistrationsController < Manager::ApplicationController
  before_action :find_charity
  before_action :find_registration

  def show
  end

  def update
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
    @registration.destroy
     # after manager clicks "deny":
     # destroy registration object
     # close modal with js
    redirect_to manager_charity_url(@charity)
  end

  private

  def find_charity
    @charity = Charity.find(params[:charity_id])
  end

  def find_registration
    @registration = Registration.find(params[:id])
  end
end
