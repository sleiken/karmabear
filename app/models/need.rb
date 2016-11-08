class Need < ApplicationRecord
  enum status: [ :inactive, :active ]
  belongs_to :charity
  has_many   :donations
  has_many   :givers, through: :donations

  validates :name, :description, :charity, :status, presence: true
  validates :quantity_needed, numericality: { greater_than_or_equal_to: 0 }
end
