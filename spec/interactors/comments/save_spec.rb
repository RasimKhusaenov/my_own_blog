require "rails_helper"

RSpec.describe Comments::Save do
  include_context "with interactor"

  let(:initial_context) { { comment: comment, comment_params: comment_params } }
  let(:comment) { nil }
  let(:comment_params) do
    {
      content: content,
      article: article,
      user: user
    }
  end
  let(:article) { create :article }
  let(:user) { create :user }
  let(:content) { "Some content" }

  describe ".call" do
    context "when comment doesn't exist" do
      it "saves comment" do
        expect { interactor.run }.to change(Comment, :count).by(1)

        expect(context.comment).to be_persisted
      end
    end

    context "when comment already exists" do
      let!(:comment) { create :comment }

      it "updates comment" do
        expect { interactor.run }.not_to change(Comment, :count)

        expect(comment).to be_persisted
        expect(comment.content).to eq content
      end
    end

    context "when comment can't be saved" do
      let(:content) { nil }
      let(:expected_error_message) { "Something went wrong." }

      it "doesn't save comment" do
        expect { interactor.run }.not_to change(Comment, :count)

        expect(context.comment).not_to be_persisted
        expect(context.error).to eq expected_error_message
      end
    end
  end
end
