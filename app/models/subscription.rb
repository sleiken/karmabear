class Subscription < ApplicationRecord
  belongs_to :charity
  belongs_to :giver
end
