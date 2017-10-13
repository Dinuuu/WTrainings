class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :training_session

  enum status: { pending: 0, accepted: 1, declined: 2, maybe: 3 }

  validates :user, :training_session, presence: true
  validates :user, uniqueness: { scope: :training_session }

  scope :attended, -> { where(attended: true) }
  scope :not_attended, -> { where(attended: false) }
end
