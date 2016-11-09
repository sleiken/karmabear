class NotificationsController < ApplicationController
  def index
    p current_manager
    @notifications = Notification.all.reverse
  end

  def signin
    $current_manager = { id: 1 }
  end

  def signout
    $current_manager = nil
  end

  private
end
