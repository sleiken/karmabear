class Subscription < ApplicationRecord
  after_create_commit { create_notification }

  belongs_to :charity
  belongs_to :giver

  validates :giver, uniqueness: { scope: :charity }
  validates :giver, :charity, presence: true

  private

  def create_notification
    Notification.create!(manager_id: 1, giver_id: 1, content: "cheese")
  end
end
