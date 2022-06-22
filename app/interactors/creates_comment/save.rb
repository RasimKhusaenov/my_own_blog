module CreatesComment
  class Save
    include Interactor

    delegate :comment, to: :context

    def call
      raise_error unless comment.save
    end

    private

    def raise_error
      context.fail!(error: I18n.t("flash.users.comments.create.failure"))
    end
  end
end
