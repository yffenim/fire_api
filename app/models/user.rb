class User < ApplicationRecord
  require 'pry-byebug'
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :alerts
  has_many :seconds
  has_many :thirds

  after_create :update_access_token!  

  validates :username, presence: true
  validates :email, presence: true


  private

  def update_access_token!
    self.access_token = "#{self.id}:#{Devise.friendly_token}"
    binding.pry
    save
  end
  
end
