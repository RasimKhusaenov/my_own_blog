require "rails_helper"

RSpec.describe CreatesComment::Create do
  include_context "with interactor"

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

  context "with invalid params" do
    let(:comment_params) { { content: nil } }

    it "failures" do
      interactor.run

      expect(context).to be_failure
    end

    it "doesn't create comment" do
      expect { interactor.run }.not_to change(Comment, :count)
    end
  end
end
