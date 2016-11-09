class Subscription < ApplicationRecord
  after_create_commit { create_follow_notification(self) }

  belongs_to :charity
  belongs_to :giver

  validates :giver, uniqueness: { scope: :charity }
  validates :giver, :charity, presence: true

  private

  def create_follow_notification(subscription)
    manager = subscription.charity.manager
    Notification.create!(manager_id: (manager.id if manager) || 1,
                         giver_id: subscription.giver.id,
                         content: "")
  end

  def create_unfollow_notification(subscription)
    manager = subscription.charity.manager
  end
end
