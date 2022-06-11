require "rails_helper"

RSpec.describe Companies::RegistrationPolicy do
  let(:policy) { described_class.new(record: company, user: user) }
  let(:company) { build_stubbed :company }
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
