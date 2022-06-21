module Users
  class CommentPolicy < ApplicationPolicy
    def create?
      user.present?
    end
  end
end
