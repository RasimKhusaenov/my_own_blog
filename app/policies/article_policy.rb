class ArticlePolicy < ApplicationPolicy
  relation_scope do |relation|
    next relation if user&.administrative_role?

    relation.published.or(relation.where(user: user))
            .or(relation.where(company: user&.companies).where.not(company: nil))
  end

  alias_rule :update?, :destroy?, to: :edit?

  def create?
    user&.administrative_role? || user&.companies&.include?(record&.company)
  end

  def edit?
    user.present? && (user.administrative_role? || user_is_author? || user_is_company_owner?)
  end

  private

  def user_is_author?
    record.user == user
  end

  def user_is_company_owner?
    user == record&.company&.owner
  end
end
