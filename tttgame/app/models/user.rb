class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true
  attr_accessible :email, :password, :password_confirmation, :user_name

  has_many :games
  has_many :moves 
end
