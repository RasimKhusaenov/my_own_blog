class ArticlesController < ApplicationController
  expose :article, scope: -> { authorized_articles }
  expose :articles, -> { ArticleDecorator.wrap(paginate(authorized_articles)) }

  def index; end

  def show; end

  private

  def authorized_articles
    authorized(Article.order(created_at: :desc))
  end
end
