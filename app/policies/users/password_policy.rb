module Users
  class PasswordPolicy < ApplicationPolicy
    def edit?
      true
    end

    def update?
      true
    end
  end
end
