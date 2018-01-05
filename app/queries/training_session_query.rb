class TrainingSessionQuery
  attr_reader :relation, :date, :year, :user, :after_date

  def initialize(relation=TrainingSession.all)
    @relation = relation
  end

  def find(options={})
    load_options(options)
    filter_after_date if after_date.present?
    filter_by_month if date.present?
    filter_by_year if year.present?
    filter_by_user if user.present?
    relation.finished
  end

  private

  def load_options(options)
    @date = options[:date]
    @year = options[:year]
    @user = options[:user_id]
    @after_date = options[:after_date]
  end

  def filter_by_month
    @relation = relation.where("to_char(training_sessions.dictation_date, 'YYYY-MM') = ?", date)
  end

  def filter_by_year
    @relation = relation.where('extract(year from training_sessions.dictation_date) = ?', year)
  end

  def filter_after_date
    @relation = relation.where('training_sessions.dictation_date < ', after_date)
  end

  def filter_by_user
    @relation = relation.joins(:invitations)
                        .where(invitations: { user_id: user, attended: true })
  end
end