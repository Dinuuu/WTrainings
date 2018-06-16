class InvitationSerializer < ActiveModel::Serializer
  attributes :status, :attended

  has_one :training_session
end