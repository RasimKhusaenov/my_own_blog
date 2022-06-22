require "rails_helper"

RSpec.describe CreatesComment::Save do
  include_context "with interactor"

  let(:initial_context) { { comment: comment } }

  let(:comment) { build :comment, content: "Rasim was here" }
  let(:expected_comment_params) do
    {
      content: "Rasim was here"
    }
  end

  it "saves comment" do
    expect { interactor.run }.to change(Comment, :count).by(1)

    expect(context.comment).to have_attributes(expected_comment_params)
  end

  context "with invalid params" do
    let(:comment) { build :comment, user_id: nil }

    it "failures" do
      interactor.run

      expect(context).to be_failure
    end

    it "doesn't save comment" do
      expect { interactor.run }.not_to change(Comment, :count)
    end
  end
end
