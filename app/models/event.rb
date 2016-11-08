class Event < ApplicationRecord
  belongs_to :charity
  has_many   :registrations
  has_many   :givers, through: :registrations

  validates :name, :description, :start, :end, :charity, presence: true
  validates :givers_needed, numericality: { greater_than_or_equal_to: 0 }
end
