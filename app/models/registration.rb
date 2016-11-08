class Registration < ApplicationRecord
  belongs_to :event
  belongs_to :giver

  validates :giver, uniqueness: { scope: :event }
  validates :giver, :event, presence: true
  validates :pending_hours, numericality: { greater_than_or_equal_to: 0 }
  validates :approved_hours, numericality: { greater_than_or_equal_to: 0 }

  def approve_hours
    update_attributes(approved_hours: pending_hours, pending_hours: 0)
  end
end
