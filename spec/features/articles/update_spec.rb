require "rails_helper"

RSpec.feature "Update Article" do
  include_context "when admin signed in"

  let!(:article) { create :article }
  let(:update_attributes) do
    {
      title: "New title"
    }
  end

  scenario "User updates article" do
    visit article_path(article)

    click_button "Edit"

    fill_form :article, **update_attributes

    click_button "Update Article"

    expect(page).to have_content("Article was updated.")
    expect(page).to have_content(update_attributes[:title])
  end
end
