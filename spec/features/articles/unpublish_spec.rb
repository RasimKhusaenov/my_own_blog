require "rails_helper"

RSpec.feature "Unpublish Article" do
  include_context "when admin signed in"

  let(:article) { create(:article, :published) }

  scenario "User unpublishes article" do
    visit article_path(article)

    click_button "Back to Draft"

    expect(page).to have_content("Publication of the article has been canceled!")
  end
end
