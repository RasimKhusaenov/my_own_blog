require "rails_helper"

RSpec.feature "Create comment" do
  include_context "when user signed in"

  let(:comment_attributes) { attributes_for :comment }
  let(:article) { create :article, :published }

  scenario "User creates comment" do
    visit article_path(article)

    fill_form :comment, **comment_attributes

    click_button "Share"

    expect(page).to have_content("Comment saved!")
    expect(page).to have_content(comment_attributes[:content])
  end
end
