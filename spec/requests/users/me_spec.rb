require "rails_helper"

RSpec.describe "Users::Me", type: :request do
  include_context "when user signed in (controllers)"

  describe "GET /show" do
    it "renders a user email" do
      get users_me_path
      expect(response).to be_successful
      expect(response.body).to include(user.email)
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      get edit_users_me_path
      expect(response).to be_successful
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) { { last_name: "Khusaenov" } }

      before do
        patch users_me_path, params: { user: new_attributes }
      end

      it "updates the user" do
        expect(User.last.last_name).to eq(new_attributes[:last_name])
      end

      it "redirects to the user profile" do
        expect(response).to redirect_to(users_me_path)
      end
    end

    context "with invalid parameters" do
      let(:invalid_attributes) { { first_name: "" } }

      it "renders a successful response (i.e. to display the 'edit' template)" do
        patch users_me_path, params: { user: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end
end
