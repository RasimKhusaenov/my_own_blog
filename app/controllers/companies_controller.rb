class CompaniesController < ApplicationController
  expose :article, scope: -> { authorized_articles }
  expose :articles, -> { ArticleDecorator.wrap(paginate(filtered_articles)) }

  def show; end

  private

  def authorized_articles
    authorized current_company.articles.order(created_at: :desc)
                              .includes(:comments)
  end

  def filtered_articles
    FilteredArticlesQuery.new(authorized_articles, filter_params).all
  end

  def filter_params
    params.permit(:page, :search)
  end
end
