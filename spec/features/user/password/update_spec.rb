require "rails_helper"

RSpec.feature "Update password" do
  include_context "when user signed in"

  before do
    visit edit_users_passwords_path
  end

  scenario "User updates password with valid data" do
    fill_form(:password, current_password: current_user.password, new_password: "2", password_confirmation: "2")
    click_on "Update"

    expect(page).to have_content("Password updated!")
  end
end
