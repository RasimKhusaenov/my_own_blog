require "rails_helper"

RSpec.feature "Search Article" do
  let!(:article_1) { create(:article, :published, title: "How to add search to Rails project?") }
  let!(:article_2) { create(:article, :published, content: "Why you not use pg_search?") }
  let!(:article_3) { create(:article, :published, title: "Invalid") }
  let!(:article_4) { create(:article, content: "Search") }

  scenario "User search article" do
    visit root_path

    fill_in :search, with: "search"

    click_button "Search"

    expect(page).to have_content(article_1.title)
    expect(page).to have_content(article_2.title)

    expect(page).not_to have_content(article_3.title)
    expect(page).not_to have_content(article_4.title)
  end
end
