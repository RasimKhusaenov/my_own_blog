class ArticlesController < ApplicationController
  expose :article, scope: -> { authorized_articles }
  expose :articles, -> { ArticleDecorator.wrap(authorized_articles) }

  def index; end

  def show; end

  private

  def authorized_articles
    authorized(Article.all)
  end
end
