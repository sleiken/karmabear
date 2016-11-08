class Location < ApplicationRecord
  belongs_to :giver

  validates :giver, :name, :lat, :lng, presence: true
end
