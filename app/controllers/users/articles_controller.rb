module Users
  class ArticlesController < BaseController
    expose :article
    expose :articles, -> { ArticleDecorator.wrap(authorized_articles) }

    def create
      if article.save
        respond_with article
      else
        render "articles/index"
      end
    end

    private

    def authorize_resource!
      authorize! article
    end

    def authorized_articles
      authorized(Article.all)
    end

    def article_params
      params.require(:article).permit(:title, :content)
    end
  end
end
