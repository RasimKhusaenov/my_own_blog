require "rails_helper"

RSpec.describe Users::CommentPolicy do
  let(:policy) { described_class.new(comment, user: current_user) }
  let(:current_user) { build :user, id: 1 }
  let(:article) { create :article, :published }
  let(:comment) { build :comment, article: article }

  describe "#create?" do
    subject { policy.create? }

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

  describe "#manage?" do
    subject { policy.manage? }

    let(:comment) { build_stubbed :comment, user_id: user_id }

    context "when current user is comment's author" do
      let(:user_id) { current_user.id }

      it { is_expected.to be_truthy }
    end

    context "when current user isn't comment's author" do
      let(:user_id) { 2 }

      it { is_expected.to be_falsey }
    end
  end
end
