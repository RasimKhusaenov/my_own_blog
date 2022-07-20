module Users
  class ArticlesController < Users::BaseController
    expose :article
    expose :articles, -> { ArticleDecorator.wrap(paginate(authorized_articles)) }

    def new; end

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
      params.require(:article).permit(:title, :content).merge(user: current_user)
    end
  end
end
