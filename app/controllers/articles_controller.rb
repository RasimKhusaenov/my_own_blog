class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  skip_before_action :authorize_resource!, only: %i[index show]
  skip_after_action :verify_authorized

  expose :article

  def index
    @articles = if current_user&.administrative_role?
                  Article.all
                else
                  Article.published.all
                end
  end

  def show
    @article = Article.find(params[:id])
  end

  def new; end

  def create
    if article.save
      redirect_to article, notice: I18n.t("article.created.success")
    else
      render :new
    end
  end

  private

  def authorize_resource!
    authorize Article
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
