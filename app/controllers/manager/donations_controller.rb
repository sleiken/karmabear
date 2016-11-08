class Manager::DonationsController < Manager::ApplicationController
  before_action :find_charity
  before_action :find_donation

  def show
  end

  def update
    @giver = @donation.giver

    # put this in a helper method!
    @donation.quantity_approved = @donation.quantity_pending
    @donation.quantity_pending = 0

    @donation.save!
    # after manager clicks "approve":
    # update user points on user object
    # close modal with js
    redirect_to manager_charity_url(@charity)
  end

  def destroy
    @donation.destroy
     # after manager clicks "deny":
     # destroy donation object
     # close modal with js
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
