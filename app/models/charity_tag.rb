class CharityTag < ApplicationRecord
  belongs_to :tag
  belongs_to :charity
end
