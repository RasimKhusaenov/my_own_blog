require "rails_helper"

RSpec.describe "Users::Me", type: :request do
  let(:valid_attributes) { { first_name: "Rasim", email: "rasim.khusaenov@flatstack.dev", password: "101" } }
  let(:invalid_attributes) { { first_name: "Rasim", email: "", password: "101" } }

  describe "GET /show" do
    before do
      post registrations_path, params: { user: valid_attributes }
      get users_me_path
    end

    it "renders a successful response" do
      expect(response).to be_successful
    end

    it "renders a user email" do
      expect(response.body).to include(valid_attributes[:email])
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      post registrations_path, params: { user: valid_attributes }
      get edit_users_me_path
      expect(response).to be_successful
    end
  end

  describe "PATCH /update" do
    before do
      post registrations_path, params: { user: valid_attributes }
    end

    context "with valid parameters" do
      let(:new_attributes) { { last_name: "Khusaenov" } }

      before do
        patch users_me_path, params: { user: new_attributes }
      end

      it "updates the user" do
        expect(User.last.last_name).to eq("Khusaenov")
      end

      it "redirects to the user profile" do
        expect(response).to redirect_to(users_me_path)
      end
    end

    context "with invalid parameters" do
      before do
        patch users_me_path, params: { user: invalid_attributes }
      end

      it "renders a successful response (i.e. to display the 'edit' template)" do
        expect(response).to be_successful
      end
    end
  end
end
