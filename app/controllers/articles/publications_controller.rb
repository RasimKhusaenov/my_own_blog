module Articles
  class PublicationsController < ApplicationController
    expose :article, scope: -> { authorized(Article.all) }

    def create
      article.update(published: true)

      respond_with article, location: root_path
    end

    private

    def authorize_resource!
      authorize! article, with: Articles::PublicationPolicy
    end
  end
end
