class Need < ApplicationRecord
  enum status: [ :inactive, :active ]
  belongs_to :charity
  has_many   :donations
  has_many   :givers, through: :donations
end
