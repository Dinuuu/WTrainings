class TrainingSessionQuery
  attr_reader :relation, :month_number, :year

  def initialize(relation=TrainingSession.all)
    @relation = relation
  end

  def find(options={})
    load_options(options)
    filter_by_month if month_number.present?
    fillter_by_year if year.present?
    relation.finished
  end

  private

  def load_options(options)
    @month_number = Date::MONTHNAMES.find_index(options[:month]) if options[:month].present? 
    @year = options[:year]
  end

  def filter_by_month
    @relation = relation.where('extract(month from training_sessions.dictation_date) = ?', month_number)
  end

  def fillter_by_year
    @relation = relation.where('extract(year from training_sessions.dictation_date) = ?', year)
  end
end