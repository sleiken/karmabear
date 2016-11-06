class NeedsController < ApplicationController
  def show
    @charity = Charity.find(params[:charity_id])
    @need = Need.find(params[:id])
  end
end