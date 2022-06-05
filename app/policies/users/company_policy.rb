module Users
  class CompanyPolicy < ApplicationPolicy
    def create?
      user.companies.blank?
    end
  end
end
