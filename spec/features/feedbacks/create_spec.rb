require "rails_helper"

RSpec.feature "Send Feedback" do
  let(:feedback_attributes) { attributes_for(:feedback) }

  scenario "User creates feedback" do
    visit new_feedback_path

    feedback_attributes[:name] = feedback_attributes.delete :author
    fill_form :feedback, feedback_attributes

    click_button "Send"

    expect(page).to have_content("Feedback was successfully sent!")
  end
end
