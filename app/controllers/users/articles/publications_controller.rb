module Users
  module Articles
    class PublicationsController < BaseController
      expose :article, scope: -> { authorized(Article.all) }

      def create
        article.update(published: true)

        respond_with article, location: root_path
      end

      def destroy
        article.update(published: false)

        respond_with article, location: root_path
      end

      private

      def authorize_resource!
        authorize! article, with: Users::Articles::PublicationPolicy
      end
    end
  end
end
