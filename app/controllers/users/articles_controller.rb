module Users
  class ArticlesController < BaseController
    expose :article, scope: -> { authorized(Article.all) }

    def new; end

    def create
      article.save

      respond_with article
    end

    private

    def authorize_resource!
      authorize! article
    end

    def article_params
      params.require(:article).permit(:title, :content)
    end
  end
end
