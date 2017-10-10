class User < ApplicationRecord
  has_many :training_users
  has_many :trainings, through: :training_users
  
	validates :email, presence: true
  validates :email, uniqueness: true
end
