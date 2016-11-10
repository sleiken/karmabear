module NotificationsHelper
  def render_notification(notification)
    if notification.action == "follow"
      ApplicationController.renderer.render(partial: 'notifications/follow', locals: { notification: notification })
    elsif notification.action == "unfollow"
      ApplicationController.renderer.render(partial: 'notifications/unfollow', locals: { notification: notification })
    elsif notification.action == "donate"
      donation = Donation.find(notification.content)
      ApplicationController.renderer.render(partial: 'notifications/donate', locals: { notification: notification, need: donation.need, donation: donation})
    elsif notification.action == "volunteer"
      ApplicationController.renderer.render(partial: 'notifications/volunteer', locals: { notification: notification })
    end
  end
end
