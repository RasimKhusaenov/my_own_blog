module Users
  class CompanyPolicy < ApplicationPolicy
    def create?
      user.company_members.where(role: :owner).blank?
    end
  end
end
