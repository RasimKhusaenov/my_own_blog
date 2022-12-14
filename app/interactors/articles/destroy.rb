module Articles
  class Destroy
    include Interactor

    delegate :article, to: :context

    def call
      raise_invalid unless article.destroy
    end

    private

    def raise_invalid
      context.fail!(error: I18n.t("flash.users.articles.destroy.failure"))
    end
  end
end
