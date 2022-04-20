require "rails_helper"

RSpec.describe "Articles", type: :request do
  include_context "when admin signed in (controllers)"

  let(:valid_attributes) { { title: "Internship", content: "It's been a wonderful 3 months" } }

  describe "GET /index" do
    it "renders an message about no articles" do
      get articles_url

      expect(response).to be_successful
      expect(response.body).to include("But it is not.")
    end
  end

  describe "GET /show" do
    it "renders an article title" do
      post users_articles_path, params: { article: valid_attributes }
      get article_path(Article.last)

      expect(response).to be_successful
      expect(response.body).to include(valid_attributes[:title])
    end
  end
end
