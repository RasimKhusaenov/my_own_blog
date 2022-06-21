require "rails_helper"

RSpec.describe Users::CommentPolicy do
  let(:policy) { described_class.new(comment, user: current_user) }
  let(:current_user) { build :user }
  let(:article) { create :article, :published }
  let(:comment) { build :comment, article: article }

  describe "#create?" do
    subject { policy.apply(:create?) }

    context "when current user present and article published" do
      it { is_expected.to be_truthy }
    end

    context "when article is draft" do
      let(:article) { create :article }

      it { is_expected.to be_falsey }
    end

    context "when no current user" do
      let(:current_user) { nil }

      it { is_expected.to be_falsey }
    end
  end
end
