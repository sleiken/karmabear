class NotificationsController < ApplicationController
  def index
    @manager = $current_manager
    @notifications = Notification.for_display
  end
end
