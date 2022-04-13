class ArticlePolicy < ApplicationPolicy
  def create?
    user.administrative_role?
  end
end
