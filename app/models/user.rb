class User < ApplicationRecord
  has_many :training_users
  has_many :trainings, through: :training_users
  has_many :invitations
  
	validates :email, presence: true
  validates :email, uniqueness: true

  def name
    full_name || email&.split('@')&.first
  end
end
