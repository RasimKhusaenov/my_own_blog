module CreatesComment
  class Create
    include Interactor

    delegate :comment_params, to: :context

    def call
      context.comment = comment

      raise_error if comment.invalid?
    end

    private

    def comment
      @comment ||= Comment.create(comment_params)
    end

    def raise_error
      context.fail!(error: I18n.t("flash.users.comments.create.failure"))
    end
  end
end
