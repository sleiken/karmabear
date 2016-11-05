class Giver < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :subscriptions
  has_many :locations
  has_many :donations
  has_many :registrations
  has_many :needs,              through: :donations
  has_many :events,             through: :registrations
  has_many :followed_charities, through: :subscriptions, source: :charity
end
