class Manager::RegistrationsController < Manager::ApplicationController
  before_action :find_charity
  before_action :find_registration

  def show
  end

  def update
    @registration.approve_hours
    @registration.save!
    # update user points

    # redirect for testing purposes:
    redirect_to manager_charity_url(@charity)
  end

  def destroy
    @registration.destroy

    # redirect for testing purposes:
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
