require "rails_helper"

RSpec.describe "Articles", type: :request do
  include_context "when admin signed in (controllers)"

  let(:valid_attributes) { { title: "Internship", content: "It's been a wonderful 3 months" } }
  let(:article) { create(:article) }

  describe "GET /index" do
    it "renders an message about no articles" do
      get articles_url

      expect(response).to be_successful
      expect(response.body).to include("But it is not.")
    end
  end

  describe "GET /show" do
    it "renders an article title" do
      get article_path(article)

      expect(response).to be_successful
      expect(CGI.unescapeHTML(response.body)).to include(article.title)
    end
  end
end
