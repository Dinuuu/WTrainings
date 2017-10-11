class TrainingSession < ApplicationRecord
  belongs_to :training
  belongs_to :trainer, class_name: 'User', foreign_key: 'user_id'

  enum status: { planned: 0, canceled: 1, finished: 2, tentative: 3 }

  has_many :invitations

  validates :training, presence: true
end
