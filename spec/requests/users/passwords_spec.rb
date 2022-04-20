require "rails_helper"

RSpec.describe "Users::Passwords", type: :request do
  include_context "when user signed in (controllers)"

  let(:valid_attributes) { { current_password: user.password, new_password: "2", password_confirmation: "2" } }

  describe "GET /edit" do
    it "render a successful response" do
      get edit_users_passwords_path
      expect(response).to be_successful
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
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
      let(:invalid_attributes) { { current_password: "" } }

      it "renders a successful response (i.e. to display the 'edit' template)" do
        patch users_passwords_path, params: { password_form: { **invalid_attributes } }
        expect(response).to be_successful
      end
    end
  end
end
