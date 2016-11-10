class Notification < ApplicationRecord
  enum action: [:unfollow, :follow, :donate, :volunteer]

  belongs_to :giver
  belongs_to :manager

  scope :for_display, -> { order('created_at DESC').first(10) }

  after_create_commit { broadcast_notification(self) }

  private

  def broadcast_notification(notification)
    DashChannel.broadcast_to(notification.manager,
                             message: render_notification(notification))
  end

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
