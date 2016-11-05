class Charity < ApplicationRecord
  belongs_to :manager
  has_many   :events
  has_many   :needs
  has_many   :subscriptions
  has_many   :donations,     through: :needs
  has_many   :registrations, through: :events
  has_many   :followers,     through: :subscriptions, source: :giver
  has_many   :volunteers,    through: :events,        source: :givers
  has_many   :donors,        through: :needs,         source: :givers
end
