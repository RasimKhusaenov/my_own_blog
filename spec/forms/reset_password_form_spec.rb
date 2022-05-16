require "rails_helper"

RSpec.describe ResetPasswordForm do
  subject(:form) { described_class.new(password_params) }

  let(:new_password) { "NEW" }
  let(:password_confirmation) { new_password }
  let(:password_params) do
    {
      new_password: new_password,
      password_confirmation: password_confirmation
    }
  end

  it { expect(form).to be_valid }

  context "when invalid params" do
    context "when empty new password" do
      let(:expected_error_data) { ["New password can't be blank"] }
      let(:new_password) { "" }

      it "validates resource" do
        expect(form).to be_invalid
        expect(form.errors.full_messages).to eq(expected_error_data)
      end
    end

    context "when new passwords doesn't match" do
      let(:expected_error_data) { ["Password confirmation doesn't match password"] }
      let(:password_confirmation) { "3" }

      it "validates resource" do
        expect(form).to be_invalid
        expect(form.errors.full_messages).to eq(expected_error_data)
      end
    end
  end
end
