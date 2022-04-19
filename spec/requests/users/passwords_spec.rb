require "rails_helper"

RSpec.describe "Users::Passwords", type: :request do
  let(:valid_attributes) { { current_password: "1", new_password: "2", password_confirmation: "2" } }
  let(:invalid_attributes) { { current_password: "" } }

  before do
    post registrations_path, params: { user: attributes_for(:user) }
    User.last.update(password: "1")
  end

  describe "GET /edit" do
    it "render a successful response" do
      get edit_users_passwords_path
      expect(response).to be_successful
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) { { last_name: "Khusaenov" } }

      before do
        patch users_passwords_path, params: { password_form: { **valid_attributes } }
      end

      it "updates the user's password" do
        expect(User.last.valid_password?("2")).to eq(User.last)
      end

      it "redirects to the user profile" do
        expect(response).to redirect_to(users_me_path)
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        patch users_passwords_path, params: { password_form: { **invalid_attributes } }
        expect(response).to be_successful
      end
    end
  end
end
