class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable
  include DeviseTokenAuth::Concerns::User

  has_many :alerts
  has_many :seconds
  has_many :thirds

  extend Devise::Models
 
  # fixing weird unpermitted params error: https://stackoverflow.com/questions/30496770/devise-token-auth-cant-create-user-account-after-installing-devise-token-auth
  before_validation :set_provider
  before_validation :set_uid

  def set_provider
    self[:provider] = "email" if self[:provider].blank?
  end

  def set_uid
    self[:uid] = self[:email] if self[:uid].blank? && self[:email].present?
  end

end
