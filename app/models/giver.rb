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
    where(provider: auth.provider, fbid: auth.uid).first_or_create do |giver|
      giver.fbid = auth.uid
      giver.email = auth.info.email
      giver.first_name = /([^\s]+)/.match(auth.info.name)[0]
      giver.last_name = /(?:\S+ ){1}(\S+)/.match(auth.info.name)[1]
      giver.password = Devise.friendly_token[0,20]
      giver.username = giver.first_name.downcase + giver.last_name.downcase
      giver.image_url = auth.info.image
    end
  end

  # def self.from_mobile_omniauth(auth)
  #   where(fbid: auth['id']).first_or_create do |giver|
  #     giver.fbid = auth['id']
  #     giver.email = auth['email']
  #     giver.first_name = auth['first_name']
  #     giver.last_name = auth['last_name']
  #     giver.password = Devise.friendly_token[0,20]
  #     giver.username = giver.first_name.downcase + giver.last_name.downcase
  #     # giver.image_url = auth['picture']['data']['url']
  #   end
  def self.from_mobile_omniauth(auth)
    where(fbid: auth['id']).first_or_create do |giver|
      # giver.fbid = auth['id']
      giver.email = auth['email']
      giver.first_name = auth['first_name']
      giver.last_name = auth['last_name']
      giver.password = Devise.friendly_token[0,20]
      giver.username = giver.first_name.downcase + giver.last_name.downcase
      # giver.image_url = auth['picture']['data']['url']
    end
  end
end
