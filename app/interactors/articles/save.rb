module Articles
  class Save
    include Interactor

    delegate :article_params, to: :context

    def call
      context.article = article

      raise_invalid unless article.update(article_params)
    end

    private
    
    def article
      @article ||= context.article || Article.new
    end

    def raise_invalid
      context.fail!(error: I18n.t("flash.users.articles.save.failure"))
    end
  end
end
