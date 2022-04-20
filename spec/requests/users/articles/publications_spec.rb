require "rails_helper"

RSpec.describe "Users::Articles::Publications", type: :request do
  include_context "when admin signed in (controllers)"

  let(:article) { create(:article, published: published) }

  describe "POST /publications" do
    let(:published) { false }

    it "publishes article" do
      post users_article_publications_path(article)
      expect(article.reload.published).to be true
    end
  end

  describe "DELETE /publications" do
    let(:published) { true }

    it "unpublishes article" do
      delete users_article_publication_path(article, article.id)
      expect(article.reload.published).to be false
    end
  end
end
