class CharityTag < ApplicationRecord
  belongs_to :tag
  belongs_to :charity

  validates :charity, :tag, presence: true
end
