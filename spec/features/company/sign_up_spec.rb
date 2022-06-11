require "rails_helper"

RSpec.feature "Sign Up" do
  let(:company) { create :company }

  scenario "Guest signs up" do
    visit new_company_registration_path(company)

    fill_in "First name", with: "Rasim"
    fill_in "Email", with: "rasim.khusaenov@flatstack.dev"
    fill_in "Password", with: "101"

    click_button "Sign Up"

    expect(page).to have_content("You've signed up!")
  end
end
