class Manager::ApplicationController < ApplicationController
  before_action :authorize_manager

  private

  def authorize_manager
    if Charity.find_by!(id: params[:charity_id]).manager
      manager_id = Charity.find_by!(id: params[:charity_id]).manager.id
      if current_manager != Manager.find_by!(id: manager_id)
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end
end
