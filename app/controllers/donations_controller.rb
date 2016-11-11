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
      @need.quantity_needed -= @donation.quantity_pending
      @need.save!

      redirect_to charity_need_path(@charity, @need)
    else
      @errors = @donation.errors.full_messages
      render "new"
    end
  end

  def edit
    @donation = donation.find(params[:id])
  end

  def update
    @donation = Donation.find(params[:id])
    @donation.update(donation_params)

    if @donation.save
      redirect_to charity_need_url(@charity, @need)
    else
      @errors = @donation.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @donation = Donation.find(params[:id])
    @donation.destroy!
    @need.quantity_needed += @donation.quantity_pending
    @need.save!

    redirect_to charity_need_url(@charity, @need)
  end

  private

  def donation_params
    params.require(:donation).permit(:quantity_pending)
  end

  def find_charity
    @charity = Charity.find(params[:charity_id])
  end

  def find_need
    @need = Need.find(params[:need_id])
  end
end
