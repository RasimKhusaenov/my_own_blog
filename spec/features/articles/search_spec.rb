require "rails_helper"

RSpec.feature "Search Article" do
  let!(:target_articles) do
    [
      create(:article, :published, title: "How to add search to Rails project?"),
      create(:article, :published, content: "Why you not use pg_search?")
    ]
  end

  scenario "User search article" do
    visit root_path

    fill_in :search, with: "search"

    click_button "Search"

    expect(page).to have_content(target_articles.first.title)
    expect(page).to have_content(target_articles.last.content)
  end
end
