class Country < ApplicationRecord
  validates :name, presence: true
  has_many :training_sessions
end
