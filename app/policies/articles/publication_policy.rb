module Articles
  class PublicationPolicy < ApplicationPolicy
    def create?
      record.draft? && user&.administrative_role?
    end
  end
end
