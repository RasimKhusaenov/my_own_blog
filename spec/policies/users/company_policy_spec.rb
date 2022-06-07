require "rails_helper"

RSpec.describe Users::CompanyPolicy do
  let(:policy) { described_class.new(user: current_user) }
  let(:current_user) { create :user }

  describe "#create?" do
    subject { policy.apply(:create?) }

    context "when user doesn't have company" do
      it { is_expected.to be_truthy }
    end

    context "when user writer in some company" do
      before do
        create :company_member, user: current_user, role: :writer
      end

      it { is_expected.to be_truthy }
    end

    context "when user have his own company" do
      before do
        create :company_member, user: current_user, role: :owner
      end

      it { is_expected.to be_falsey }
    end
  end
end
