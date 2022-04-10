require "rails_helper"

RSpec.feature "Update profile" do
  include_context "when user signed in"

  before do
    visit edit_user_path
  end

  scenario "User updates profile with valid data" do
    fill_form(:user, :edit, last_name: "Khusaenov")
    click_on "Update"

    expect(page).to have_content("Last name: Khusaenov")
  end
end
