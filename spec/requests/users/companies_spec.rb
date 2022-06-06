require "rails_helper"

RSpec.describe "Companies", type: :request do
  include_context "when user signed in (controllers)"

  let(:valid_attributes) { { official_name: "Khusaenov Industries" } }

  describe "GET /new" do
    it "renders a successful response" do
      get new_users_company_path
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      before do
        post users_company_path, params: { company: valid_attributes }
      end

      it "creates a new company" do
        expect(Company.count).to eq 1
      end

      it "redirects to the blog page" do
        expect(response).to redirect_to(root_path)
      end
    end

    context "with invalid parameters" do
      let(:invalid_attributes) { { company: { official_name: "" } } }

      it "doesn't create a new company" do
        post users_company_path, params: { company: invalid_attributes }

        expect(response).to be_successful
        expect(Company.count).to be_zero
      end
    end
  end
end
