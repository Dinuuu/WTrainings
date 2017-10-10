class Trainer < ApplicationRecord
  belongs_to :user
  belongs_to :training

  validates :user, :training, presence: true
  validates :user, uniqueness: { scope: :training }
end
