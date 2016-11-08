class Manager::DonationsController < Manager::ApplicationController
  def index

  end

  def show
    @donation = Donation.find(params[:id])
    @charity = Charity.find(params[:charity_id])
  end

  def update
    @donation = Donation.find(params[:id])
    @charity = Charity.find(params[:charity_id])
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
    @donation = Donation.find(params[:id])
    @charity = Charity.find(params[:charity_id])
    @donation.destroy
     # after manager clicks "deny":
     # destroy donation object
     # close modal with js
    redirect_to manager_charity_url(@charity)
  end
end
