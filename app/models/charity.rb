class Charity < ApplicationRecord
  acts_as_mappable :default_units => :miles,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :lat,
                   :lng_column_name => :lng

  belongs_to :manager, optional: true
  has_many   :events
  has_many   :needs
  has_many   :subscriptions
  has_many   :donations,     through: :needs
  has_many   :registrations, through: :events
  has_many   :followers,     through: :subscriptions, source: :giver
  has_many   :volunteers,    through: :events,        source: :givers
  has_many   :donors,        through: :needs,         source: :givers

  validates :name, :lat, :lng, :address, :phone, presence: true
end
