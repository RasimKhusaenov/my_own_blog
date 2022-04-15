require "rails_helper"

RSpec.feature "Create Article" do
  include_context "when admin signed in"

  let(:article_attributes) { attributes_for(:article) }

  scenario "User creates article" do
    visit root_path

    fill_form(:article, **article_attributes)

    click_button "Create Article"

    expect(page).to have_content("Article was successfully created.")
  end
end
