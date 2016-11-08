class Location < ApplicationRecord
  belongs_to :giver

  validates :giver, presence: true
end
