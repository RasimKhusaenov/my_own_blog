class FilteredArticlesQuery < BaseFilteredQuery
  private

  SEARCH_SQL = <<-SQL.squish.freeze
    title ILIKE :pattern OR content ILIKE :pattern
  SQL

  def by_search(relation, pattern)
    relation.where(SEARCH_SQL, pattern: "%#{pattern}%")
  end
end
