require "rails_helper"

RSpec.feature "Destroy Comment" do
  include_context "when user signed in"

  let(:article) { create :article }
  let!(:comment) { create :comment, article: article }

  scenario "User destroys comment" do
    visit article_path(article)

    click_button "Destroy"

    expect(page).to have_content(article.content)
  end
end
