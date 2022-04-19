require "rails_helper"

RSpec.feature "Update password" do
  include_context "when user signed in"

  before do
    User.last.update(password: "1")
    visit edit_users_passwords_path
  end

  scenario "User updates password with valid data" do
    fill_form(:password, current_password: "1", new_password: "2", password_confirmation: "2")
    click_on "Update"

    expect(page).to have_content("Password updated!")
  end
end
