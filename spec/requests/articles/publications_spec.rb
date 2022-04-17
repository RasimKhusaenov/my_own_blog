require "rails_helper"

RSpec.describe "Articles::Publications", type: :request do
  let(:valid_attributes) { { title: "Internship", content: "It's been a wonderful 3 months" } }

  before do
    post user_path, params: { user: attributes_for(:user) }
    User.last.update(role: :admin)
  end

  describe "POST /publications" do
    before do
      post articles_path, params: { article: valid_attributes }
      post article_publications_path(Article.last)
    end

    it "publishes article" do
      expect(Article.last.published).to be true
    end
  end

  describe "DELETE /publications" do
    before do
      article = Article.create! valid_attributes.merge!(published: true)
      delete article_publication_path(article, article.id)
    end

    it "unpublishes article" do
      expect(Article.last.published).to be false
    end
  end
end
