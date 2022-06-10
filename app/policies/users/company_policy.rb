module Users
  class CompanyPolicy < ApplicationPolicy
    def create?
      user.own_company.blank?
    end
  end
end
