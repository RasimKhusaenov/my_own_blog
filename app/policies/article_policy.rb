class ArticlePolicy < ApplicationPolicy
  alias article record

  def create?
    user&.administrative_role?
  end
end
