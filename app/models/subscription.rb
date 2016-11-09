class Subscription < ApplicationRecord
  after_create_commit { create_follow_notification(self) }
  after_destroy_commit { create_unfollow_notification(self) }

  belongs_to :charity
  belongs_to :giver

  validates :giver, uniqueness: { scope: :charity }
  validates :giver, :charity, presence: true

  private

  def create_follow_notification(subscription)
    manager = subscription.charity.manager
    if manager
      Notification.create!(manager_id: manager.id,
                           giver_id: subscription.giver.id,
                           action: 1,
                           content: "")
    end
  end

  def create_unfollow_notification(subscription)
    manager = subscription.charity.manager
    if manager
      Notification.create!(manager_id: manager.id,
                           giver_id: subscription.giver.id,
                           action: 0,
                           content: "")
    end
  end
end
