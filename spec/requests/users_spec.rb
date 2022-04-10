require "rails_helper"

RSpec.describe "Users", type: :request do
  let(:valid_attributes) { { first_name: "Rasim", email: "rasim.khusaenov@flatstack.dev", password: "101" } }
  let(:invalid_attributes) { { first_name: "Rasim", email: "", password: "101" } }

  describe "GET /new" do
    it "renders a successful response" do
      get new_user_path
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new user" do
        expect { post user_path, params: { user: valid_attributes } }.to change(User, :count).by(1)
      end

      it "redirects to the blog page" do
        post user_path, params: { user: valid_attributes }
        expect(response).to redirect_to(root_path)
      end
    end

    context "with invalid parameters" do
      it "does not create a new user" do
        expect { post user_path, params: { user: invalid_attributes } }.to change(User, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post user_path, params: { user: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "GET /show" do
    before do
      post user_path, params: { user: valid_attributes }
      get user_path
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
      post user_path, params: { user: valid_attributes }
      get edit_user_url
      expect(response).to be_successful
    end
  end

  describe "PATCH /update" do
    before do
      post user_path, params: { user: valid_attributes }
    end

    context "with valid parameters" do
      let(:new_attributes) { { last_name: "Khusaenov" } }

      before do
        patch user_path, params: { user: new_attributes }
      end

      it "updates the user" do
        expect(User.last.last_name).to eq("Khusaenov")
      end

      it "redirects to the user profile" do
        expect(response).to redirect_to(user_path)
      end
    end

    context "with invalid parameters" do
      before do
        patch user_path, params: { user: invalid_attributes }
      end

      it "renders a successful response (i.e. to display the 'edit' template)" do
        expect(response).to be_successful
      end
    end
  end
end
