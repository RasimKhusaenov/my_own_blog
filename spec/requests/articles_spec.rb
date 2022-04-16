require "rails_helper"

RSpec.describe "Articles", type: :request do
  let(:valid_attributes) { { title: "Internship", content: "It's been a wonderful 3 months" } }
  let(:invalid_attributes) { { title: "", content: "" } }

  before do
    post user_path, params: { user: attributes_for(:user) }
    User.last.update(role: :admin)
  end

  describe "GET /index" do
    it "renders a successful response" do
      get articles_url
      expect(response).to be_successful
    end

    it "renders an message about no articles" do
      get articles_url
      expect(response.body).to include("But it is not.")
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new article" do
        expect { post articles_path, params: { article: valid_attributes } }.to change(Article, :count).by(1)
      end

      it "redirects to the new article page" do
        post articles_path, params: { article: valid_attributes }
        expect(response).to redirect_to(article_path(Article.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new article" do
        expect { post articles_path, params: { article: invalid_attributes } }.to change(Article, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post articles_path, params: { article: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "GET /show" do
    before do
      post articles_path, params: { article: valid_attributes }
      get article_path(Article.last)
    end

    it "renders a successful response" do
      expect(response).to be_successful
    end

    it "renders an article title" do
      expect(response.body).to include(valid_attributes[:title])
    end
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
end
