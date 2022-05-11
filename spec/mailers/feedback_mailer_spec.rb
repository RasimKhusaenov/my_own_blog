require "rails_helper"

RSpec.describe FeedbackMailer, type: :mailer do
  describe "#send_feedback" do
    let(:mail) { described_class.send_feedback(feedback_params) }
    let(:feedback_params) { attributes_for(:feedback) }

    it { expect(mail.subject).to eq("Feedback received") }
    it { expect(mail.from).to match_array(feedback_params[:email]) }
  end
end
