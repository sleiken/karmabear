class CharityTag < ApplicationRecord
  belongs_to :tag
  belongs_to :charity

  validates :charity, :tag, :name, presence: true
end
