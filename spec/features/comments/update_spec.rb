require "rails_helper"

RSpec.feature "Update Comment" do
  include_context "when user signed in"

  let(:article) { create :article, :published }
  let!(:comment) { create :comment, article: article, user: current_user }
  let(:content) { "Some content" }

  scenario "User updates comment" do
    visit article_path(article)

    find(:xpath, "//a[@href='/users/articles/#{article.id}/comments/#{comment.id}/edit']").click

    fill_in :comment_content, with: content

    click_button "Update Comment"

    expect(page).to have_content(content)
  end
end
