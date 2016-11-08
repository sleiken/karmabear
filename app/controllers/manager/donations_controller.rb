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
    # after manager clicks "approve":
    # update user points on user object
    # close modal with js
    redirect_to '/'
  end

  def destroy
     # after manager clicks "deny":
     # destroy donation object
     # close modal with js
    redirect_to '/'
  end
end
