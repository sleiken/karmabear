class Manager::DonationsController < Manager::ApplicationController
  before_action :find_charity
  before_action :find_donation

  def show
  end

  def update
    @donation.approve_quantity
    @donation.save!

    # update user points on user object

    # redirect for testing purposes:
    redirect_to manager_charity_url(@charity)
  end

  def destroy
    @donation.destroy

    # redirect for testing purposes:
    redirect_to manager_charity_url(@charity)
  end

  private

  def find_charity
    @charity = Charity.find(params[:charity_id])
  end

  def find_donation
    @donation = Donation.find(params[:id])
  end
end
