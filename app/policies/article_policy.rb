class ArticlePolicy < ApplicationPolicy
  relation_scope do |relation|
    next relation if user&.administrative_role?

    relation.published
  end

  def create?
    user&.administrative_role?
  end
end
