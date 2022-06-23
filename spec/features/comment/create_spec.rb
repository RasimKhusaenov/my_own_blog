require "rails_helper"

RSpec.feature "Create comment" do
  include_context "when user signed in"

  let(:article) { create :article, :published }

  scenario "User creates comment" do
    visit article_path(article)

    fill_in :comment_content, with: "Rasim was here"

    click_button "Send"

    expect(page).to have_content("Comment saved!")
    expect(page).to have_content("Rasim was here")
  end
end
