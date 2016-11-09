class Notification < ApplicationRecord
  enum action: [:unfollow, :follow]

  belongs_to :giver
  belongs_to :manager

  scope :for_display, -> { order('created_at DESC').first(10) }

  after_create_commit { broadcast_notification(self) }

  private

  def broadcast_notification(notification)
    DashChannel.broadcast_to(notification.manager,
                             manager: notification.manager.email,
                             message: render_notification(notification))
  end

  def render_notification(notification)
    ApplicationController.renderer.render(partial: 'notifications/notification', locals: { notification: notification })
  end
end
