require "rails_helper"

RSpec.describe "Users::Articles", type: :request do
  include_context "when admin signed in (controllers)"

  let(:valid_attributes) { { title: "Internship", content: "It's been a wonderful 3 months" } }

  describe "GET /new" do
    it "renders a successful response" do
      get new_users_article_path
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    let(:created_article) { Article.last }

    context "with valid parameters" do
      before do
        post users_articles_path, params: { article: valid_attributes }
      end

      it "creates a new article" do
        expect(Article.count).to eq 1
      end

      it "redirects to the new article page" do
        expect(response).to redirect_to(article_path(created_article))
      end
    end

    context "with invalid parameters" do
      let(:invalid_attributes) { { title: "", content: "" } }

      it "does not create a new article" do
        post users_articles_path, params: { article: invalid_attributes }

        expect(response).to be_successful
        expect(Article.count).to be_zero
      end
    end
  end

  describe "PATCH /update" do
    let!(:article) { create :article, title: title }
    let(:title) { "The old title" }

    context "with valid parameters" do
      before do
        patch users_article_path(article), params: { article: valid_attributes }
      end

      it "doesn't create a new article" do
        expect { response }.not_to change(Article, :count)
      end

      it "redirects to the article page" do
        expect(response).to redirect_to article_path(article)
      end
    end

    context "with invalid parameters" do
      let(:invalid_attributes) { { title: "", content: "" } }

      it "doesn't update the article" do
        patch users_article_path(article), params: { article: invalid_attributes }

        expect(response).to be_successful
        expect(article.reload.title).to eq title
      end
    end
  end

  describe "DELETE /destroy" do
    let!(:article) { create :article }

    context "with existing article" do
      before do
        delete users_article_path(article)
      end

      it "destroys article" do
        response

        expect(Article.where(id: article.id)).not_to be_exists
      end

      it "redirects to the root" do
        expect(response).to redirect_to(articles_path)
      end
    end
  end
end
