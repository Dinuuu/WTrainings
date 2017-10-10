class TrainingSession < ApplicationRecord
  belongs_to :training
  belongs_to :trainer, class_name: 'User', foreign_key: 'user_id'

  has_many :invitations

  validates :training, presence: true
end
