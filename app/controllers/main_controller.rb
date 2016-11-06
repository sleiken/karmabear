class MainController < ApplicationController
  def index
  end

  def search
    @charities = Charity.by_distance(origin: params[:search])
    p @charities
  end
end
