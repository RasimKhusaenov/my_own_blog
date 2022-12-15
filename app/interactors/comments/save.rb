module Comments
  class Save
    include Interactor

    delegate :comment_params, to: :context

    def call
      context.comment = comment

      raise_error unless comment.update(comment_params)
    end

    private

    def comment
      @comment ||= context.comment || Comment.new
    end

    def raise_error
      context.fail!(error: I18n.t("flash.users.comments.save.failure"))
    end
  end
end
