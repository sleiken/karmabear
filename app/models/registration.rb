class Registration < ApplicationRecord
  belongs_to :event 
  belongs_to :giver
end
