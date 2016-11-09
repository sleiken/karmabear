class NeedsController < ApplicationController
  def show
    @charity = Charity.find(params[:charity_id])
    @need = Need.find(params[:id])
    @giver = current_giver
    @donation = @need.donations.find_or_create_by(giver_id: @giver)
  end
end
