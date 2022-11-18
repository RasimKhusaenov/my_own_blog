module Articles
  class Update
    include Interactor

    delegate :article, :article_params, to: :context

    def call
      raise_invalid unless article.update(article_params)
    end

    private

    def raise_invalid
      context.fail!(error: I18n.t("flash.users.articles.update.failure"))
    end
  end
end
