class CompaniesController < ApplicationController
  expose :articles, -> { ArticleDecorator.wrap(paginate(authorized_articles)) }
  expose :company, find_by: :slug

  def show; end

  private

  def authorized_articles
    authorized(company.articles.order(created_at: :desc).includes(:comments))
  end
end
