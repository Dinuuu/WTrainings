class Training < ApplicationRecord
  has_many :training_users
  has_many :trainers, through: :training_users, source: :user
  has_many :training_sessions

  accepts_nested_attributes_for :training_users

  enum kind: { technical: 0, methodological: 1, creative: 2, management: 3, other: 4 }
  enum t_type: { internal: 0, external: 1 }

  validates :name, :program, :objective, :kind, :t_type, presence: true
end
