require "rails_helper"

RSpec.describe "PasswordResetss", type: :request do
  let(:valid_attributes) { { new_password: "NEW", password_confirmation: "NEW" } }
  let(:token) { user.signed_id(purpose: :password_reset, expires_in: User::TOKEN_EXPIRATION_TIME) }
  let(:user) { create :user }

  describe "GET /new" do
    it "render a successful response" do
      get new_password_reset_path
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    it "render a successful response" do
      post password_reset_path, params: { email: user.email }
      expect(response).to redirect_to(root_path)
    end
  end

  describe "GET /edit" do
    context "with token" do
      it "render a successful response" do
        get edit_password_reset_path(token: token)
        expect(response).to be_successful
      end
    end

    context "without token" do
      it "redirects to sign in page" do
        get edit_password_reset_path
        expect(response).to redirect_to(new_session_path)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      before do
        patch password_reset_path, params: { reset_password_form: { **valid_attributes }, token: token }
      end

      it "updates the user's password" do
        expect(user.reload.valid_password?("NEW")).to eq(user)
      end

      it "redirects to the sign in page" do
        expect(response).to redirect_to(new_session_path)
      end
    end

    context "with invalid parameters" do
      let(:invalid_attributes) { { new_password: "" } }

      it "renders a successful response (i.e. to display the 'edit' template)" do
        patch password_reset_path, params: { reset_password_form: { **invalid_attributes }, token: token }
        expect(response).to be_successful
      end
    end
  end
end
