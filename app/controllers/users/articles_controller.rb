module Users
  class ArticlesController < Users::BaseController
    expose :article, :fetch_article
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
      authorized(Article.all.includes(:comments))
    end

    def article_params
      return default_article_params if params[:article].blank?

      params.require(:article).permit(:title, :content).merge(default_article_params)
    end

    def default_article_params
      @default_article_params ||= { user: current_user, company: current_company }
    end

    def fetch_article
      params[:id].present? ? Article.find(params[:id]) : Article.new(article_params)
    end
  end
end
