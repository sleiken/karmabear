module NotificationsHelper
  def render_notification(notification)
    if notification.action == "follow"
      ApplicationController.renderer.render(
        partial: 'notifications/follow',
        locals: { notification: notification })
    elsif notification.action == "unfollow"
      ApplicationController.renderer.render(
        partial: 'notifications/unfollow',
        locals: { notification: notification })
    elsif notification.action == "donate"
      donation = Donation.find_by(id: notification.content)
      if donation
        ApplicationController.renderer.render(
          partial: 'notifications/donate',
          locals: { notification: notification,
                    need: donation.need,
                    donation: donation})
      end
    elsif notification.action == "volunteer"
      registration = Registration.find_by(id: notification.content)
      if registration
      ApplicationController.renderer.render(
        partial: 'notifications/volunteer',
        locals: { notification: notification,
                  event: registration.event,
                  registration: registration })
      end
    end
  end
end
