require "rails_helper"

RSpec.describe CreateComment do
  include_context "with interactor"

  describe ".call" do
    let(:initial_context) { { comment_params: comment_params } }

    let(:comment_params) do
      {
        content: "Rasim was here",
        article_id: create(:article).id,
        user_id: create(:user).id
      }
    end
    let(:expected_comment_params) do
      {
        content: "Rasim was here"
      }
    end

    it "creates comment" do
      expect { interactor.run }.to change(Comment, :count).by(1)

      expect(context.comment).to have_attributes(expected_comment_params)
    end
  end
end
