class Subscription < ApplicationRecord
  after_create_commit { create_notification(self) }

  belongs_to :charity
  belongs_to :giver

  validates :giver, uniqueness: { scope: :charity }
  validates :giver, :charity, presence: true

  private

  def create_notification(subscription)
    manager = subscription.charity.manager
    Notification.create!(manager_id: (manager.id if manager) || 1,
                         giver_id: subscription.giver.id,
                         content: "")
  end
end
