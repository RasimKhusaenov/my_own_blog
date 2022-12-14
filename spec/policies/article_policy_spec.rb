require "rails_helper"

RSpec.describe ArticlePolicy do
  let(:policy) { described_class.new(record, user: current_user) }

  describe "#create?" do
    subject { policy.apply(:create?) }

    it_behaves_like "administrative role rule" do
      let(:record) { build_stubbed(:article) }
    end
  end

  describe "#update?" do
    subject { policy.apply(:update?) }

    let(:record) { build :article }

    context "when current user is superadmin" do
      let(:current_user) { build :user, :superadmin }

      it { is_expected.to be true }
    end

    context "when current user is admin" do
      let(:current_user) { build :user, :admin }

      it { is_expected.to be true }
    end

    context "when current user is reader" do
      let(:current_user) { build :user, :reader }

      context "when he isn't author of the article" do
        it { is_expected.to be false }
      end

      context "when he is author of the article" do
        let(:record) { build :article, user: current_user }

        it { is_expected.to be true }
      end
    end
  end
end
