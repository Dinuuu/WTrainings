class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :training_session

  enum status: { pending: 0, accepted: 1, declined: 2, assisted: 3 }

  validates :user, :training_session, presence: true
end
