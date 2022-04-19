require "rails_helper"

RSpec.describe "Users::Articles::Publications", type: :request do
  let(:article) { create(:article, published: published) }

  before do
    post registrations_path, params: { user: attributes_for(:user) }
    User.last.update(role: :admin)
  end

  describe "POST /publications" do
    let(:published) { false }

    before do
      post users_article_publications_path(article)
    end

    it "publishes article" do
      expect(Article.last.published).to be true
    end
  end

  describe "DELETE /publications" do
    let(:published) { true }

    before do
      delete users_article_publication_path(article, article.id)
    end

    it "unpublishes article" do
      expect(Article.last.published).to be false
    end
  end
end
