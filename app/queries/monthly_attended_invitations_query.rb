class MonthlyAttendedInvitationsQuery
  attr_reader :relation, :month_number

  def initialize(month_name, relation=Invitation.all)
    @relation = relation
    @month_number = Date::MONTHNAMES.find_index(month_name)
  end

  def find
    @relation = relation.joins(:training_session)
                        .where(training_sessions: { status: :finished})
                        .where('extract(month from training_sessions.dictation_date) = ?', month_number)
                        .attended
  end
end