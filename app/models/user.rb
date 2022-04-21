class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable
  include DeviseTokenAuth::Concerns::User

  has_many :alerts
  has_many :seconds
  has_many :thirds

  extend Devise::Models


end
