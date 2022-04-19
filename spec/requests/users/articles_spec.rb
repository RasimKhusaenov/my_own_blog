require "rails_helper"

RSpec.describe "Users::Articles", type: :request do
  let(:valid_attributes) { { title: "Internship", content: "It's been a wonderful 3 months" } }
  let(:invalid_attributes) { { title: "", content: "" } }

  before do
    post registrations_path, params: { user: attributes_for(:user) }
    User.last.update(role: :admin)
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new article" do
        expect { post users_articles_path, params: { article: valid_attributes } }.to change(Article, :count).by(1)
      end

      it "redirects to the new article page" do
        post users_articles_path, params: { article: valid_attributes }
        expect(response).to redirect_to(article_path(Article.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new article" do
        expect { post users_articles_path, params: { article: invalid_attributes } }.to change(Article, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post users_articles_path, params: { article: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end
end
