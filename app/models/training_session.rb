class TrainingSession < ApplicationRecord
  belongs_to :training
  belongs_to :trainer, class_name: 'User', foreign_key: 'user_id'

  enum status: { planned: 0, canceled: 1, finished: 2, tentative: 3 }

  has_many :invitations, inverse_of: :training_session
  accepts_nested_attributes_for :invitations, allow_destroy: true

  validates :training, presence: true

  def name
  	"#{training&.name} - #{dictation_date&.strftime('%^B')}"
  end
end
