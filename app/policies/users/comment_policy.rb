module Users
  class CommentPolicy < ApplicationPolicy
    def create?
      user.present? && record.article.published?
    end

    def edit?
      update?
    end

    def update?
      record.user == user
    end
  end
end
