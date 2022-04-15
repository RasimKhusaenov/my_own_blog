require "rails_helper"

RSpec.describe ArticleDecorator do
  let(:article) { create(:article, title: "Internship", content: content, published: published) }
  let(:content) { "It's been a wonderful 3 months. I really like it." }
  let(:published) { false }

  describe "#preview" do
    subject { described_class.new(article).preview }

    it { is_expected.to eq("It's been a wonderful 3 months. I really...") }
  end

  describe "#card_color" do
    subject { described_class.new(article).card_color }

    context "when article isn't published" do
      it { is_expected.to eq("secondary") }
    end

    context "when article is published" do
      let(:published) { true }

      it { is_expected.to eq("dark") }
    end
  end
end
