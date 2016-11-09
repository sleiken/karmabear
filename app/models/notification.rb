class Notification < ApplicationRecord
  belongs_to :giver
  validates :content, presence: true
  scope :for_display, -> { order(:created_at).last(50) }
  after_create_commit { EventBroadcastJob.perform_later self }
end
