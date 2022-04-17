module Articles
  class PublicationPolicy < ApplicationPolicy
    def create?
      record.draft? && user&.administrative_role?
    end

    def destroy?
      record.published? && user&.administrative_role?
    end
  end
end
