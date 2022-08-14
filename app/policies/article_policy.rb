class ArticlePolicy < ApplicationPolicy
  relation_scope do |relation|
    next relation if user&.administrative_role?

    relation.published && relation.where(user: user)
    # TODO: Find out how to show current company drafts to company members
  end

  def create?
    user&.administrative_role? || user&.companies&.include?(record&.company)
  end
end
