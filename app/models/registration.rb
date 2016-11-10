class Registration < ApplicationRecord
  after_create_commit { create_volunteer_notification(self) }

  belongs_to :event
  belongs_to :giver

  scope :pending, -> { where("pending_hours > ?", 0) }

  validates :giver, uniqueness: { scope: :event }
  validates :giver, :event, presence: true
  validates :pending_hours, numericality: { greater_than_or_equal_to: 0 }
  validates :approved_hours, numericality: { greater_than_or_equal_to: 0 }

  def approve_hours
    update_attributes(approved_hours: pending_hours, pending_hours: 0)
  end

  private

  def create_volunteer_notification(registration)
    manager = registration.event.charity.manager
    if manager
      Notification.create!(manager_id: manager.id,
                           giver_id: registration.giver.id,
                           action: 3,
                           content: "")
    end
  end
end
