module Users
  class CommentPolicy < ApplicationPolicy
    alias_rule :update?, :destroy?, :edit?, to: :manage?

    def create?
      user.present? && record.article.published?
    end

    def manage?
      record.user_id == user.id
    end
  end
end
