require "rails_helper"

RSpec.feature "Update Article" do
  include_context "when admin signed in"

  let!(:article) { create :article }
  let(:article_params) do
    {
      title: "New title"
    }
  end

  scenario "User updates article" do
    visit article_path(article)

    click_button "Edit"

    fill_form :article, **article_params

    click_button "Update Article"

    expect(page).to have_content("Article was updated.")
    expect(page).to have_content(article_params[:title])
  end
end
