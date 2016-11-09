class ManagersSessionsController < Devise::SessionsController
  before_action :set_current_manager, only: [:create]
  before_action :reset_manager, only: [:destroy]

  private

  def set_current_manager
    $current_manager = current_manager if current_manager
  end

  def reset_manager
    $current_manager = nil
  end
end
