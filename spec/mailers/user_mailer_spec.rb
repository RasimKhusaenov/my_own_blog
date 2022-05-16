require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "#password_reset" do
    let(:mail) { described_class.password_reset(user) }
    let(:user) { create(:user) }

    it { expect(mail.subject).to eq("Password reset requested") }
    it { expect(mail.to).to match_array(user.email) }
  end
end
