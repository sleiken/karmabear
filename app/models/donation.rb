class Donation < ApplicationRecord
  after_create_commit { create_donate_notification(self) }

  belongs_to :need
  belongs_to :giver

  scope :pending, -> { where("quantity_pending > ?", 0) }

  validates :need, :giver, presence: true
  validates :quantity_pending, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity_approved, numericality: { greater_than_or_equal_to: 0 }

  def approve_quantity
    update_attributes(quantity_approved: quantity_pending, quantity_pending: 0)
  end

  private

  def create_donate_notification(donation)
    manager = donation.need.charity.manager
    if manager
      Notification.create!(manager_id: manager.id,
                           giver_id: donation.giver.id,
                           action: 2,
                           content: donation.id)
    end
  end
end
