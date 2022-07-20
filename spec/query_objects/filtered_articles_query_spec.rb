require "rails_helper"

RSpec.describe FilteredArticlesQuery do
  subject(:all) { query.all }

  let(:query) { described_class.new(relation, filter_params) }
  let(:relation) { Article.all }

  context "with no params" do
    let(:filter_params) { {} }

    it { is_expected.to match_array(relation) }
  end

  describe "#by_search" do
    let!(:article_1) { create :article, :published, title: "How to add search to Rails project?" }
    let!(:article_2) { create :article, content: "Why you not use pg_search?" }
    let!(:article_3) { create :article, title: "Invalid" }

    context "when search param is empty" do
      let(:filter_params) { { search: "" } }
      let(:expected_result) { [article_1, article_2, article_3] }

      it { is_expected.to match_array(expected_result) }
    end

    context "when search param is present" do
      let(:filter_params) { { search: "search" } }
      let(:expected_result) { [article_1, article_2] }

      it { is_expected.to match_array(expected_result) }
    end
  end
end
