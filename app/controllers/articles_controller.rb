class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  skip_before_action :authorize_resource!, only: %i[index show]
  skip_after_action :verify_authorized

  expose :article, scope: -> { policy_scope(Article) }
  expose :articles, -> { ArticleDecorator.wrap(policy_scope(Article)) }

  def index; end

  def show; end

  def create
    article.save

    respond_with article, action: :index
  end

  def edit; end

  def update
    redirect_to root_path, notice: I18n.t("flash.articles.publish.success") if article.update(article_params)
  end

  private

  def authorize_resource!
    authorize Article
  end

  def article_params
    params.require(:article).permit(:title, :content, :published)
  end
end
