require "rails_helper"

RSpec.describe Article, type: :model do
  subject(:article) { described_class.new(title: "Internship", content: "It's been a wonderful 3 months") }

  describe "validations" do
    it "is valid with valid attributes" do
      expect(article).to be_valid
    end

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:content) }
  end

  describe "'published' scope" do
    let!(:published_articles) { create_list(:article, 3, :published) }

    before do
      create_list(:article, 3)
    end

    it "returns published articles" do
      expect(described_class.published).to match_array(published_articles)
    end
  end
end
