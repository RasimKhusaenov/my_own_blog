require "rails_helper"

RSpec.feature "Sign Up" do
  let(:user_email) { "rasim.khusaenov@flatstack.dev" }

  before do
    visit new_user_path
  end

  scenario "Guest signs up" do
    fill_in "First name", with: "Rasim"
    fill_in "Email", with: user_email
    fill_in "Password", with: "101"

    click_button "Sign Up"

    expect(page).to have_content("You've successfully signed up!")
  end
end
