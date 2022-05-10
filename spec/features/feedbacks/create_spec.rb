require "rails_helper"

RSpec.feature "Send Feedback" do
  include ActiveJob::TestHelper

  let(:feedback_attributes) { attributes_for(:feedback, :for_form) }

  before do
    ActiveJob::Base.queue_adapter = :test

    visit new_feedback_path

    fill_form :feedback, feedback_attributes.except(:author)

    perform_enqueued_jobs do
      click_button "Send"
    end

    open_email("rasim.khusaenov@flatstack.dev")
  end

  scenario "checking letter subject" do
    expect(current_email.subject).to eq("Feedback received")
  end

  scenario "checking letter body" do
    expect(current_email).to have_content("Feedback from #{feedback_attributes[:author]}")
    expect(current_email).to have_content(feedback_attributes[:message])
  end

  scenario "viewing success sending message" do
    expect(page).to have_content("Feedback was successfully sent!")
  end
end
