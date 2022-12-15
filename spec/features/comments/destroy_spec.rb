require "rails_helper"

RSpec.feature "Destroy Comment" do
  include_context "when user signed in"

  let(:article) { create :article, :published }
  let!(:comment) { create :comment, article: article, user: current_user }

  scenario "User destroys comment" do
    visit article_path(article)

    find(:xpath, "//a[@href='/users/articles/#{article.id}/comments/#{comment.id}']").click

    expect(page).not_to have_content(comment.content)
  end
end
