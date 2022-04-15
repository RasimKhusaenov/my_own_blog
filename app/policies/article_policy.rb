class ArticlePolicy < ApplicationPolicy
  class Scope < BaseScope
    def resolve
      return scope.all if user&.administrative_role?

      scope.published
    end
  end

  def create?
    user&.administrative_role?
  end

  def update?
    user&.administrative_role?
  end
end
