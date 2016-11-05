class Need < ApplicationRecord
  belongs_to :charity
  has_many   :donations
  has_many   :givers, through: :donations
end
