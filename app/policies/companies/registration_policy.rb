module Companies
  class RegistrationPolicy < ApplicationPolicy
    def create?
      user.nil?
    end
  end
end
