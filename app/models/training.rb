class Training < ApplicationRecord

  validates :name, :feedback_form, :program, :slides, :objective, presence: true
end
