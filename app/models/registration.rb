class Registration < ApplicationRecord
  belongs_to :event
  belongs_to :giver

  validates :giver, uniqueness: { scope: :event }
end
