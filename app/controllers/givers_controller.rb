class GiversController < ApplicationController
  def show
    @giver = Giver.find_by(username: params[:username])
    @charities = @giver.followed_charities
    @events = @giver.events
    @needs = @giver.needs
  end
end
