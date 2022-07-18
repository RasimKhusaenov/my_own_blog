require "rails_helper"

RSpec.describe FilteredArticlesQuery do
  subject(:all) { query.all }

  let(:query) { described_class.new(relation, filter_params) }
  let(:relation) { Article.all }

  context "with no params" do
    let(:filter_params) { {} }

    it { is_expected.to match_array(relation) }
  end

  describe "search param" do
    let(:filter_params) { { search: "search" } }
    let!(:target_articles) do
      [
        create(:article, title: "How to add search to Rails project?"),
        create(:article, content: "Why you not use pg_search?")
      ]
    end

    before do
      create :article, :published
    end

    it { is_expected.to match_array(target_articles) }
  end
end
