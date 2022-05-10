require "rails_helper"

RSpec.feature "Send Feedback" do
  include ActiveJob::TestHelper

  let(:feedback_attributes) { attributes_for(:feedback) }

  before do
    ActiveJob::Base.queue_adapter = :test
  end

  scenario "User sends feedback" do
    visit new_feedback_path

    fill_form :feedback, feedback_attributes

    perform_enqueued_jobs do
      click_button "Send"
    end

    open_email("rasim.khusaenov@flatstack.dev")

    expect(current_email.subject).to eq("Feedback received")

    expect(current_email).to have_content("Feedback from #{feedback_attributes[:author]}")
    expect(current_email).to have_content(feedback_attributes[:message])

    expect(page).to have_content("Feedback was successfully sent!")
  end
end
