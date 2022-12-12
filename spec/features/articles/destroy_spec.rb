require "rails_helper"

RSpec.feature "Destroy Article" do
  include_context "when admin signed in"

  let!(:article) { create :article }

  scenario "User destroys article" do
    visit article_path(article) 

    click_button "Delete"

    expect(page).to have_content("Article was destroyed.")
  end
end
