require "rails_helper"

RSpec.feature "Sign In" do
  let(:user) { create :user }

  def sign_in(email, password)
    visit new_session_path

    fill_form(:user, email: email, password: password)

    click_button "Sign In"
  end

  scenario "Guest signs in with valid credentials" do
    sign_in(user.email, user.password)

    expect(page).to have_content("You've successfully signed in!")
  end

  scenario "Guest signs in with invalid credentials" do
    sign_in(user.email, "wrong password")

    expect(page).to have_content("Wrong email or password!")
  end
end
