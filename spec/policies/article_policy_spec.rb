require "rails_helper"

RSpec.describe ArticlePolicy do
  let(:policy) { described_class.new(record, user: current_user) }

  describe "#create?" do
    subject { policy.apply(:create?) }

    it_behaves_like "administrative role rule" do
      let(:record) { build_stubbed(:article) }
    end
  end

  describe "#edit?" do
    subject { policy.apply(:edit?) }

    let(:current_user) { create :user, :reader }

    it_behaves_like "administrative role rule" do
      let(:record) { build_stubbed :article }
    end

    context "when current user is author of the article" do
      let(:record) { build :article, user: current_user }

      it { is_expected.to be true }
    end

    context "when current user is owner of the article's company" do
      let(:record) { build_stubbed :article, company: company }
      let(:company) { create :company }

      before do
        create :company_member, user: current_user, company: company
      end

      it { is_expected.to be true }
    end
  end
end
