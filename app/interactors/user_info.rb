class UserInfo
  include Interactor

  def call
    attended_invitations = InvitationsQuery.new(Invitation.attended).find(context.to_h)
    not_attended_invitations = InvitationsQuery.new(Invitation.not_attended).find(context.to_h)
    woloxers_trained = User.find(InvitationsQuery.new(Invitation.where(training_session_id: trainings_given.ids).attended)
                                        .find(context_without_user).pluck(:user_id).uniq)
    context.result = {
      trainings_assisted: serialize_collection(attended_invitations, ::InvitationSerializer),
      trainings_invited: serialize_collection(not_attended_invitations, ::InvitationSerializer),
      trainings_given: serialize_collection(trainings_given, ::TrainingSessionSerializer),
      woloxers_trained: serialize_collection(woloxers_trained, ::UserSerializer)
    }
  end

  private

  def serialize_collection(collection, serializer)
    ActiveModel::SerializableResource.new(collection, each_serializer: serializer)
  end

  def context_without_user
    context.to_h.reject { |filter| filter == :user_id }
  end

  def trainings_given
    @trainings_given ||= TrainingSessionQuery.new.find(context_without_user.to_h.merge(trainer_id: context.user_id))
  end
end