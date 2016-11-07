class Subscription < ApplicationRecord
  belongs_to :charity
  belongs_to :giver

  validates :giver, uniqueness: { scope: :charity }
end
