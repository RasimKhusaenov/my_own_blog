module Users
  class CommentPolicy < ApplicationPolicy
    def create?
      user.present? && record.article.published?
    end
  end
end
