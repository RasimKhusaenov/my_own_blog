require "rails_helper"

RSpec.describe Companies::RegistrationPolicy do
  let(:policy) { described_class.new(user: user) }
  let(:user) { nil }

  describe "#create?" do
    subject { policy.apply(:create?) }

    context "when user authenticated" do
      let(:user) { build_stubbed :user }

      it { is_expected.to be_falsey }
    end

    context "when guest user" do
      it { is_expected.to be_truthy }
    end
  end
end
