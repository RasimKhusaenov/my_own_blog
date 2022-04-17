require "rails_helper"

RSpec.describe ArticlePolicy do
  describe "#create?" do
    subject { policy.apply(:create?) }

    it_behaves_like "administrative role rule" do
      let(:record) { build_stubbed(:article) }
    end
  end
end
