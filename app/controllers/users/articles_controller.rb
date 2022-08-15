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
      params.require(:article).permit(:title, :content).merge(user: current_user)
    end

    def fetch_article
      if params[:id].present?
        Article.find(params[:id])
      elsif current_company.present?
        fetch_company_article
      elsif params[:article].present?
        Article.new(article_params)
      else
        Article.new
      end
    end

    def fetch_company_article
      if params[:article].present?
        current_company.articles.build(article_params)
      else
        current_company.articles.build
      end
    end
  end
end
