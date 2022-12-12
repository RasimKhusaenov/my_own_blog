module Users
  class ArticlesController < Users::BaseController
    expose :article, :fetch_article
    expose :articles, -> { ArticleDecorator.wrap(paginate(authorized_articles)) }

    def new; end

    def create
      if article.save
        respond_with article
      else
        render "users/articles/new"
      end
    end

    def edit; end

    def update
      respond_with update_article.article
    end

    def destroy
      respond_with destroy_article.article
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

      params.require(:article).permit(:title, :content)
    end

    def default_article_params
      @default_article_params ||= { user: current_user, company: current_company }
    end

    def fetch_article
      params[:id].present? ? Article.find(params[:id]) : Article.new(article_params.merge(default_article_params))
    end

    def update_article
      ::Articles::Save.call(article: article, article_params: article_params)
    end

    def destroy_article
     ::Articles::Destroy.call(article: article)
    end
  end
end
