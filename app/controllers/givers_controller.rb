class GiversController < ApplicationController
  before_action :authorize_giver

  def show
    @giver = Giver.find_by(username: params[:username])
    @charities = @giver.followed_charities
    @events = @giver.events
    @needs = @giver.needs
  end

  private

  def authorize_giver
    if current_giver != Giver.find_by!(username: params[:username])
      redirect_to root_path
    end
  end
end
