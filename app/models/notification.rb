class Notification < ApplicationRecord
  belongs_to :giver
  belongs_to :manager
  validates :content, presence: true
  scope :for_display, -> { order(:created_at).last(50) }
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
