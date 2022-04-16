module Articles
  class PublicationPolicy < ApplicationPolicy
    def create?
      user&.administrative_role?
    end
  end
end
