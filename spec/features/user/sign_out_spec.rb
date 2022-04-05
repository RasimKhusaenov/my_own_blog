require "rails_helper"

RSpec.feature "Sign Out" do
  include_context "when user signed in"

  scenario "User signs out" do
    visit blog_path

    click_link "Sign out"

    expect(page).to have_content("You've successfully signed out!")
  end
end
