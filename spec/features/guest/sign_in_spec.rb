require "rails_helper"

RSpec.feature "Sign In" do
  let(:user) { create :user }

  scenario "Guest signs in with valid credentials" do
    visit new_session_path

    fill_form(:user, email: user.email, password: user.password)

    click_button "Sign In"

    expect(page).to have_content("You've successfully signed in!")
  end
end
