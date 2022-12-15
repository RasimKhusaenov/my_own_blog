require "rails_helper"

RSpec.feature "Update Comment" do
  include_context "when user signed in"

  let(:article) { create :article }
  let!(:comment) { create :comment, article: article }
  let(:comment_params) do
    {
      content: "Some content"
    }
  end

  scenario "User updates comment" do
    visit article_path(article)

    find(:xpath, "//a[@href='/users/articles/#{article.id}/comments/#{comment.id}/edit']").click

    fill_form :comment, **comment_params

    click_button "Update Comment"

    expect(page).to have_content(comment_params[:content])
  end
end
