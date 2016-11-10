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
      ApplicationController.renderer.render(partial: 'notifications/follow', locals: { notification: notification })
    elsif notification.action == "unfollow"
      ApplicationController.renderer.render(partial: 'notifications/unfollow', locals: { notification: notification })
    elsif notification.action == "donate"
      ApplicationController.renderer.render(partial: 'notifications/donate', locals: { notification: notification })
    elsif notification.action == "volunteer"
      ApplicationController.renderer.render(partial: 'notifications/volunteer', locals: { notification: notification })
    end
  end
end
