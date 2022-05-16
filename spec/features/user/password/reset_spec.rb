require "rails_helper"

RSpec.feature "Reset password" do
  let(:token) { user.signed_id(purpose: :password_reset, expires_in: User::TOKEN_EXPIRATION_TIME) }
  let(:user) { create :user }

  scenario "User requests password reset" do
    visit new_session_path

    click_on "Forgot your password?"

    expect(page).to have_content("Forgot your password?")

    fill_form(:email, email: user.email)
    click_on "Reset password"

    expect(page).to have_content("Password recovery instructions were sent if that account exists")
  end

  scenario "User resets password" do
    visit edit_password_reset_path(token: token)

    fill_form(:password, new_password: "NEW", password_confirmation: "NEW")
    click_on "Reset password"

    expect(page).to have_content("Password reset!")
  end
end
