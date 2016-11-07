class DonationsController < ApplicationController
  before_action :find_charity
  before_action :find_need

  def index
    @donations = @need.donations
  end

  def new
    @donation = Donation.new
  end

  def create
    @donation = @need.donations.new(donation_params)
    @donation.giver = current_giver

    if @donation.save
      # decrement the quantity needed on the needs show page
      @need.quantity_needed -= 1
      @need.save!

      redirect_to charity_need_path(@charity, @need)
    else
      @errors = @donation.errors.full_messages
      render "new"
    end
  end

  def update
    #update quantity given
  end

  def destroy
    #delete donation given
  end

  private

  def donation_params
    params.require(:donation).permit(:quantity_given)
  end

  def find_charity
    @charity = Charity.find(params[:charity_id])
  end

  def find_need
    @need = Need.find(params[:need_id])
  end
end
