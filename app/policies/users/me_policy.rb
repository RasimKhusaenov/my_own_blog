module Users
  class MePolicy < ApplicationPolicy
    def show?
      true
    end

    def edit?
      true
    end

    def update?
      true
    end
  end
end
