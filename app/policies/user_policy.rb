class UserPolicy < ApplicationPolicy
  def new?
    true
  end

  def create?
    true
  end

  def show?
    user.present?
  end

  def update?
    user.present?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
