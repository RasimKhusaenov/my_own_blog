class ArticlePolicy < ApplicationPolicy
  relation_scope do |relation|
    next relation if user&.administrative_role?

    relation.published.or(relation.where(user: user)).or(relation.where(company: user&.companies).where.not(company: nil))
  end

  def create?
    user&.administrative_role? || user&.companies&.include?(record&.company)
  end

  def edit?
    update?
  end

  def update?
    user.present? && (user.administrative_role? || record.user == user)
  end

  def destroy?
    update?
  end
end
