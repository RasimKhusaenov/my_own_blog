require "rails_helper"

RSpec.describe CreateComment do
  include_context "with interactor"

  describe ".call" do
    let(:initial_context) { { comment: comment } }

    let(:comment) { build :comment, content: "Rasim was here" }
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
