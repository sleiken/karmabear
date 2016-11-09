class NotificationsController < ApplicationController
  def index
    @notifications = Notification.all 
  end
  # before_action :get_notifications
  # def create
  #   notification = current_us
  # end
  #
  # private
  #
  # def get_notifications
  #   @notifications = Notification.for_display
  # end
end
