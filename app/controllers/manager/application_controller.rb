class Manager::ApplicationController < ApplicationController
  # before_action :authorize_manager, except: [:]
  #
  # private
  #
  # def authorize_manager
  #   manager_id = Charity.find(params)
  #   if current_manager != Manager.find_by!(username: params[:username])
  #     redirect_to root_path
  #   end
  # end
end
