class Subscription < ApplicationRecord
  after_create_commit { create_notification }

  belongs_to :charity
  belongs_to :giver

  validates :giver, uniqueness: { scope: :charity }
  validates :giver, :charity, presence: true

  private

  def create_notification
    Notification.create(content: Subscription.last.giver.username)
  end
end
