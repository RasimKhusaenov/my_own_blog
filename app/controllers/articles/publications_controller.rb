module Articles
  class PublicationsController < ApplicationController
    expose :article, scope: -> { policy_scope(Article) }

    def create
      article.update(published: true)

      respond_with article, location: root_path
    end

    private

    def authorize_resource!
      authorize article, policy_class: Articles::PublicationPolicy
    end
  end
end
