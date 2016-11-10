module NotificationsHelper
  def render_notification(notification)
    if notification.action == "follow"
      ApplicationController.renderer.render(partial: 'notifications/follow', locals: { notification: notification })
    elsif notification.action == "unfollow"
      ApplicationController.renderer.render(partial: 'notifications/unfollow', locals: { notification: notification })
    elsif notification.action == "donate"
      ApplicationController.renderer.render(partial: 'notifications/donate', locals: { notification: notification, need: Need.find(notification.content) })
    elsif notification.action == "volunteer"
      ApplicationController.renderer.render(partial: 'notifications/volunteer', locals: { notification: notification })
    end
  end
end
