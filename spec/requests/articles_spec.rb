require "rails_helper"

RSpec.describe "Articles", type: :request do
  let(:valid_attributes) { { title: "Internship", content: "It's been a wonderful 3 months" } }

  before do
    post registrations_path, params: { user: attributes_for(:user) }
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

  describe "GET /show" do
    before do
      post users_articles_path, params: { article: valid_attributes }
      get article_path(Article.last)
    end

    it "renders a successful response" do
      expect(response).to be_successful
    end

    it "renders an article title" do
      expect(response.body).to include(valid_attributes[:title])
    end
  end
end
