require "rails_helper"

RSpec.describe Users::Articles::PublicationPolicy do
  describe "#create?" do
    subject { policy.apply(:create?) }

    it_behaves_like "administrative role rule" do
      let(:record) { build_stubbed(:article) }
    end
  end

  describe "#destroy?" do
    subject { policy.apply(:destroy?) }

    it_behaves_like "administrative role rule" do
      let(:record) { build_stubbed(:article, :published) }
    end
  end
end
