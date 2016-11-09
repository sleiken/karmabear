class NotificationsController < ApplicationController
  def index
    @manager = $current_manager
    @notifications = Notification.all.reverse
  end
end
