class ManagersSessionsController < Devise::SessionsController
  before_action :set_current_manager, only: [:create]
  before_action :reset_manager, only: [:destroy]

  private

  def set_current_manager
    $current_manager = { id: current_manager.id }
  end

  def reset_manager
    $current_manager = { id: nil }
  end
end
