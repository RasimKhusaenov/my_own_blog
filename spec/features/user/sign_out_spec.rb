require "rails_helper"

RSpec.feature "Sign Out" do
  include_context "when user signed in"

  scenario "User signs out" do
    visit root_path

    click_link "Sign out"

    expect(page).to have_content("You've signed out!")
  end
end
