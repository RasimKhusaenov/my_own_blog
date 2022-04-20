require "rails_helper"

RSpec.describe "Users::Articles", type: :request do
  include_context "when admin signed in (controllers)"

  let(:valid_attributes) { { title: "Internship", content: "It's been a wonderful 3 months" } }
  let(:created_article) { Article.last }

  describe "POST /create" do
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
end
