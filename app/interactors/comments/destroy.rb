module Comments
  class Destroy
    include Interactor

    delegate :comment, to: :context

    def call
      raise_error unless comment.destroy
    end

    private

    def raise_error
      context.fail!(error: I18n.t("flash.users.comments.destroy.failure"))
    end
  end
end
