class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(manager)
    if current_manager
      manager_charity_path(current_manager.charity.id)
    else
      root_path
    end
  end
end
