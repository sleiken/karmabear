class Donation < ApplicationRecord
  belongs_to :need
  belongs_to :giver

  validates :need, :giver, presence: true
  validates :quantity_given, numericality: { greater_than_or_equal_to: 0 }
end
