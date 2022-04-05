require "rails_helper"

RSpec.describe "Users", type: :request do
  let(:valid_attributes) { { first_name: "Rasim", email: "rasim.khusaenov@flatstack.dev", password: "101" } }
  let(:invalid_attributes) { { first_name: "Rasim", password: "101" } }

  describe "GET /new" do
    it "renders a successful response" do
      get new_user_path
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new user" do
        expect { post users_path, params: { user: valid_attributes } }.to change(User, :count).by(1)
      end

      it "redirects to the blog page" do
        post users_path, params: { user: valid_attributes }
        expect(response).to redirect_to(blog_path)
      end
    end

    context "with invalid parameters" do
      it "does not create a new user" do
        expect { post users_path, params: { user: invalid_attributes } }.to change(User, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post users_path, params: { user: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "GET /show" do
    before do
      post users_path, params: { user: valid_attributes }
      get users_path
    end

    it "renders a successful response" do
      expect(response).to be_successful
    end

    it "renders a user email" do
      user = User.last
      expect(user.email).to eq(valid_attributes[:email])
    end
  end
end
