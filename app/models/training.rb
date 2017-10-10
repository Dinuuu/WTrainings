class Training < ApplicationRecord
  has_many :training_users
  has_many :users, through: :training_users

  validates :name, :program, :objective, presence: true
end
