require "rails_helper"

RSpec.feature "Create company" do
  include_context "when user signed in"

  let(:company_attributes) { attributes_for :company }

  scenario "User creates company" do
    visit new_users_company_path

    fill_form :company, **company_attributes

    click_button "Create"

    expect(page).to have_content("Company saved!")
  end
end
