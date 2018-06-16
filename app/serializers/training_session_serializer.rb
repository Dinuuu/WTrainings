class TrainingSessionSerializer < ActiveModel::Serializer
  attributes :status, :name, :dictation_date
end