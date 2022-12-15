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

  %i[edit? update? destroy?].each do |policy_method|
    describe "##{policy_method}" do
      subject { policy.apply(policy_method) }

      let(:comment) { build_stubbed :comment, user: user }

      context "when current user is comment's author" do
        let(:user) { current_user }

        it { is_expected.to be_truthy }
      end

      context "when current user isn't comment's author" do
        let(:user) { build_stubbed :user }

        it { is_expected.to be_falsey }
      end
    end
  end
end
