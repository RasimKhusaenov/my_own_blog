class ArticlesController < ApplicationController
  expose :article, scope: -> { authorized_articles }
  expose :comment, -> { article.comments.new }
  expose :comments, -> { article.comments.includes(:user) }
  expose :articles, -> { ArticleDecorator.wrap(paginate(filtered_articles)) }

  def index; end

  def show; end

  private

  def authorized_articles
    authorized(Article.order(created_at: :desc).includes(:comments))
  end

  def filtered_articles
    FilteredArticlesQuery.new(authorized_articles, filter_params).all
  end

  def filter_params
    params.permit(:search)
  end
end
