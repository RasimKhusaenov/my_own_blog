require "rails_helper"

RSpec.describe "Registrations", type: :request do
  let(:valid_attributes) { { first_name: "Rasim", email: "rasim.khusaenov@flatstack.dev", password: "101" } }

  describe "GET /new" do
    it "renders a successful response" do
      get new_registration_path
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      before do
        post registrations_path, params: { user: valid_attributes }
      end

      it "creates a new user" do
        expect(User.count).to eq 1
      end

      it "redirects to the blog page" do
        expect(response).to redirect_to(root_path)
      end
    end

    context "with invalid parameters" do
      let(:invalid_attributes) { { first_name: "" } }

      it "does not create a new user" do
        post registrations_path, params: { user: invalid_attributes }

        expect(response).to be_successful
        expect(User.count).to be_zero
      end
    end
  end
end
