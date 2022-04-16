module Articles
  class PublicationPolicy < ApplicationPolicy
    alias article record

    def create?
      user&.administrative_role?
    end
  end
end
