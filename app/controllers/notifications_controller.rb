class NotificationsController < ApplicationController
  def create
    ActionCable.server.broadcast 'dash_channel',
                                 content: message.content,
                                 user: message.giver.username
    head :ok
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
