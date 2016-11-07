class Giver < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :subscriptions
  has_many :locations
  has_many :donations
  has_many :registrations
  has_many :needs,              through: :donations
  has_many :events,             through: :registrations
  has_many :followed_charities, through: :subscriptions, source: :charity

  def self.from_omniauth(auth)
    where(provider: auth.provider, gid: auth.gid).first_or_create do |giver|
      giver.email = auth.info.email
      giver.password = Devise.friendly_token[0,20]
      giver.username = auth.info.name   
      # giver.image = auth.info.image # assuming the giver model has an image
    end
  end
end
