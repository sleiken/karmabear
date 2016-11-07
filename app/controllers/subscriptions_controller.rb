class SubscriptionsController < ApplicationController
  def create
    @charity = Charity.find(params[:charity_id])
    @subscription = @charity.subscriptions.new
    @subscription.giver = current_giver

    if @subscription.save
      redirect_to charity_url(@charity)
    end
  end

  def destroy
    @subscription.find(params[:id])
    @subscription.destroy!

    redirect_to charity_url(@charity)
  end
end
