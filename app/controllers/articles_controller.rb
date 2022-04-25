class ArticlesController < ApplicationController
  expose :article, scope: -> { authorized_articles }
  expose :articles, -> { ArticleDecorator.wrap(paginated_articles) }

  def index; end

  def show; end

  private

  def authorized_articles
    authorized(Article.all)
  end

  def paginated_articles
    @pagy, articles = pagy(authorized_articles)
    articles
  end
end
