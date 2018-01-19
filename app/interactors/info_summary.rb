class InfoSummary
  include Interactor

  def call
    attended_invitations = InvitationsQuery.new(Invitation.attended).find(context.to_h)
    context.result = {
      woloxers_trained: woloxers_trained(attended_invitations),
      distinct_woloxers_trained: distinct_woloxers_trained(attended_invitations),
      trainings_given: trainings_given
    }
  end

  private

  def woloxers_trained(attended_invitations)
    attended_invitations.count
  end

  def distinct_woloxers_trained(attended_invitations)
    attended_invitations.pluck(:user_id).uniq.count
  end

  def trainings_given
    TrainingSessionQuery.new.find(context.to_h).count
  end
end