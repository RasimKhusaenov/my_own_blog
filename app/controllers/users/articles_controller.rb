module Users
  class ArticlesController < Users::BaseController
    expose :article, scope: -> { authorized_articles }
    expose :articles, -> { ArticleDecorator.wrap(paginate(authorized_articles)) }
    expose :company, -> { Company.find_by!(slug: request.subdomain) }

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
