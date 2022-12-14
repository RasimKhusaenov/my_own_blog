require "rails_helper"

RSpec.describe Articles::Destroy do
  include_context "with interactor"

  let(:initial_context) { { article: article } }
  let!(:article) { create :article }

  describe ".call" do
    context "when article is destroyable" do
      it "destroys article" do
        expect { interactor.run }.to change(Article, :count).by(-1)

        expect(Article.where(id: article.id)).not_to be_exists
      end
    end

    context "when article can't be destroyed" do
      let(:expected_error_message) { "Something went wrong." }

      before do
        allow(article).to receive(:destroy).and_return(false)
      end

      it "doesn't destroy article" do
        expect { interactor.run }.not_to change(Article, :count)

        expect(context.error).to eq expected_error_message
      end
    end
  end
end
