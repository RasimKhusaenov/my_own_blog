require "rails_helper"

RSpec.describe Articles::PublicationPolicy do
  let(:user) { build_stubbed(:user) }
  let(:article) { build_stubbed(:article) }

  let(:policy) { described_class.new(article, user: user) }

  describe "#create?" do
    subject { policy.apply(:create?) }

    it "returns false when the user is not superadmin nor admin" do
      is_expected.to be false
    end

    context "when the user is superadmin" do
      let(:user) { build_stubbed(:user, :superadmin) }

      it { is_expected.to be true }
    end

    context "when the user is admin" do
      let(:user) { build_stubbed(:user, :admin) }

      it { is_expected.to be true }
    end
  end
end
