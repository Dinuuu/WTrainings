class Training < ApplicationRecord
  has_many :training_users
  has_many :users, through: :training_users

  enum kind: { technical: 0, methodological: 1, creative: 2, management: 3, other: 4 }

  validates :name, :program, :objective, presence: true
end
