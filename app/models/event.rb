class Event < ApplicationRecord
  belongs_to :charity
  has_many   :registrations
  has_many   :givers
end
