class MonthlyInfo
  include Interactor

  def call
    month_number = Date::MONTHNAMES.find_index(context.month)
    attended_invitations = MonthlyAttendedInvitationsQuery.new(context.month).find
    context.result = {
      woloxers_trained: woloxers_trained(attended_invitations),
      distinct_woloxers_trained: distinct_woloxers_trained(attended_invitations),
      trainings_given: trainings_given(month_number)
    }
  end

  private

  def woloxers_trained(attended_invitations)
    attended_invitations.count
  end

  def distinct_woloxers_trained(attended_invitations)
    attended_invitations.pluck(:user_id).uniq.count
  end

  def trainings_given(month_number)
    TrainingSession.where(status: :finished)
                   .where('extract(month from dictation_date) = ?', month_number)
                   .count
  end
end