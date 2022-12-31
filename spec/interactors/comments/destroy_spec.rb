require "rails_helper"

RSpec.describe Comments::Destroy do
  include_context "with interactor"

  let(:initial_context) { { comment: comment } }
  let!(:comment) { create :comment }

  describe ".call" do
    context "when comment is destroyable" do
      it "destroys comment" do
        expect { interactor.run }.to change(Comment, :count).by(-1)

        expect(Comment.where(id: comment.id)).not_to be_exists
      end
    end

    context "when comment can't be destroyed" do
      let(:expected_error_message) { "Something went wrong." }

      before do
        allow(comment).to receive(:destroy).and_return(false)
      end

      it "doesn't destroy comment" do
        expect { interactor.run }.not_to change(Comment, :count)

        expect(context.error).to eq expected_error_message
      end
    end
  end
end
