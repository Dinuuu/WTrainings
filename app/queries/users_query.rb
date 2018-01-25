class UsersQuery
  attr_reader :relation, :query

  def initialize(relation=User.all)
    @relation = relation
  end

  def find(options={})
    load_options(options)
    filter_by_name
    relation
  end

  private

  def load_options(options)
    @query = options[:query]
  end

  def filter_by_name
    @relation = relation.where("email ilike :query OR
                                full_name ilike :query", query: "%#{query}%") if query.present?
  end
end