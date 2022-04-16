module Articles
  class PublicationsController < ApplicationController
    skip_after_action :verify_authorized

    expose :article, scope: -> { policy_scope(Article) }

    def create
      if article.update(published: true)
        redirect_to root_path, notice: I18n.t("flash.articles.publish.success")
      else
        redirect_to article_path(article), notice: I18n.t("helpers.failure")
      end
    end

    private

    def authorize_resource!
      authorize Article
    end
  end
end
