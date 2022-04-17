require "rails_helper"

RSpec.feature "Publish Article" do
  include_context "when admin signed in"

  let(:article) { create(:article) }

  scenario "User publishes article" do
    visit article_path(article)

    click_button "Publish"

    expect(page).to have_content("You've published article!")
  end
end
