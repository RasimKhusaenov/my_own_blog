require "rails_helper"

RSpec.describe "Companies", type: :request do
  include_context "when user signed in (controllers)"

  let(:valid_attributes) do
    {
      content: "Rasim was here",
      article_id: article.id,
      user_id: user.id
    }
  end
  let(:article) { create :article }

  describe "POST /create" do
    context "with valid parameters" do
      before do
        post users_comment_path, params: { comment: valid_attributes }
      end

      it "creates a new comment" do
        expect(Comment.count).to eq 1
      end

      it "redirects to the article page" do
        expect(response).to redirect_to article_path(article)
      end
    end

    context "with invalid parameters" do
      let(:invalid_attributes) { { content: "", article_id: article.id } }

      it "doesn't create a new comment" do
        post users_comment_path, params: { comment: invalid_attributes }

        expect(response).to redirect_to article_path(article)
        expect(Comment.count).to be_zero
      end
    end
  end
end
