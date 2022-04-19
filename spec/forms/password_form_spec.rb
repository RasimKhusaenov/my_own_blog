require "rails_helper"

RSpec.describe PasswordForm do
  subject(:form) { described_class.new(password_params, user) }

  let(:user) { create(:user, password: "1") }
  let(:current_password) { "1" }
  let(:new_password) { "2" }
  let(:password_confirmation) { new_password }
  let(:password_params) do
    {
      current_password: current_password,
      new_password: new_password,
      password_confirmation: password_confirmation
    }
  end

  it { expect(form).to be_valid }

  context "when invalid params" do
    context "when invalid current password" do
      let(:expected_error_data) { ["Current password invalid"] }
      let(:current_password) { "-1" }

      it "validates resource" do
        expect(form).to be_invalid
        expect(form.errors.full_messages).to eq(expected_error_data)
      end
    end

    context "when empty current password" do
      let(:expected_error_data) { ["Current password can't be blank", "Current password invalid"] }
      let(:current_password) { "" }

      it "validates resource" do
        expect(form).to be_invalid
        expect(form.errors.full_messages).to eq(expected_error_data)
      end
    end

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
