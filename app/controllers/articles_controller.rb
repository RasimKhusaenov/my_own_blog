class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  skip_before_action :authorize_resource!, only: %i[index show]
  skip_verify_authorized

  expose :article, scope: -> { authorized(Article.all) }
  expose :articles, -> { ArticleDecorator.wrap(authorized(Article.all)) }

  def index; end

  def show; end

  def create
    article.save

    respond_with article, action: :index
  end

  private

  def authorize_resource!
    authorize! Article
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
