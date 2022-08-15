require "rails_helper"

RSpec.describe "Registrations", type: :request do
  let(:valid_attributes) { { first_name: "Rasim", email: "rasim.khusaenov@flatstack.dev", password: "101" } }
  let(:company) { create :company }

  describe "GET /new" do
    context "with no subdomain" do
      it "renders a successful response" do
        get new_registration_path
        expect(response).to be_successful
      end
    end

    context "with subdomain" do
      it "renders a successful response" do
        get new_registration_url(subdomain: company.subdomain)
        expect(response).to be_successful
      end
    end
  end

  describe "POST /create" do
    context "with valid parameters and no subdomain" do
      before do
        post registrations_path, params: { user: valid_attributes }
      end

      it "creates a new user" do
        expect(User.count).to eq 1
      end

      it "redirects to the blog page" do
        expect(response).to redirect_to root_url(subdomain: nil)
      end
    end

    context "with valid parameters and subdomain" do
      let(:created_user) { User.last }
      let(:created_member) { CompanyMember.last }

      before do
        post registrations_url(subdomain: company.subdomain), params: { user: valid_attributes }
      end

      it "creates a new user" do
        expect(User.count).to eq 1
      end

      it "makes new user a writer in company" do
        expect(created_user.companies).to match_array [company]
        expect(created_member.user).to eq created_user
        expect(created_member.role).to be_writer
      end

      it "redirects to the blog page" do
        expect(response).to redirect_to root_url
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
