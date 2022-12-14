require "rails_helper"

RSpec.describe Articles::Save do
  include_context "with interactor"

  let(:initial_context) { { article: article, article_params: article_params } }
  let(:article) { nil }
  let(:article_params) do
    {
      title: title,
      content: "Some content",
      user: user
    }
  end
  let(:user) { create :user }
  let(:title) { "New title" }

  describe ".call" do
    context "when article doesn't exist" do
      it "saves article" do
        expect { interactor.run }.to change(Article, :count).by(1)

        expect(context.article).to be_persisted
      end
    end

    context "when article already exists" do
      let!(:article) { create :article }

      it "updates article" do
        expect { interactor.run }.not_to change(Article, :count)

        expect(article).to be_persisted
        expect(article.title).to eq title
      end
    end

    context "when article can't be saved" do
      let(:title) { nil }
      let(:expected_error_message) { "Something went wrong." }

      it "doesn't save article" do
        expect { interactor.run }.not_to change(Article, :count)

        expect(context.article).not_to be_persisted
        expect(context.error).to eq expected_error_message
      end
    end
  end
end
