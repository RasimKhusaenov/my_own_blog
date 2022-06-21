require "rails_helper"

RSpec.describe Users::CommentPolicy do
  let(:policy) { described_class.new(user: current_user) }
  let(:current_user) { build :user }

  describe "#create?" do
    subject { policy.apply(:create?) }

    context "when current user present" do
      it { is_expected.to be_truthy }
    end

    context "when no current user" do
      let(:current_user) { nil }

      it { is_expected.to be_falsey }
    end
  end
end
