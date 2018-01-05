class InvitationsQuery
  attr_reader :relation, :month_number, :year, :user, :after_date

  def initialize(relation=Invitation.all)
    @relation = relation
  end

  def find(options={})
    load_options(options)
    filter_after_date if after_date.present?
    filter_by_month if month_number.present?
    fillter_by_year if year.present?
    filter_by_user if user.present?
    filter_by_finished
    relation.attended

  end

  private

  def load_options(options)
    @month_number = Date::MONTHNAMES.find_index(options[:month]) if options[:month].present? 
    @year = options[:year]
    @user = options[:user_id]
    @after_date = options[:after_date]
  end

  def filter_by_month
    @relation = relation.where('extract(month from training_sessions.dictation_date) = ?', month_number)
  end

  def filter_by_year
    @relation = relation.where('extract(year from training_sessions.dictation_date) = ?', year)
  end

  def filter_after_date
    @relation = relation.where('training_sessions.dictation_date < ', after_date)
  end

  def filter_by_user
    @relation = relation.where(user_id: user)
  end

  def filter_by_finished
    @relation = relation.joins(:training_session).where(training_sessions: { status: :finished})
  end
end