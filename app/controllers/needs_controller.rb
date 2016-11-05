class NeedsController < ApplicationController
  def show
    @charity = Charity.find(params[:charity_id])
    @need = Need.find(param[:id])
  end
end