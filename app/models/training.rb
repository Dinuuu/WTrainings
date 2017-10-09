class Training < ApplicationRecord

  validates :name, :program, :objective, presence: true
end
