class Manager::GiversController < ApplicationController
  before_action :find_charity, :find_manager

  def index
    # could just call @charity.followers in view, etc. ?
    @followers = @charity.followers
    @donors = @charity.donors
    @volunteers = @charity.volunteers
  end

  def show
    @giver = Giver.find(params[:id])
  end

  private

  def find_charity
    @charity = Charity.find(params[:charity_id])
  end

  def find_manager
    @manager = @charity.manager
  end
end
