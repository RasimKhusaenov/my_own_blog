require "rails_helper"

RSpec.describe "Registrations", type: :request do
  let(:valid_attributes) { { first_name: "Rasim", email: "rasim.khusaenov@flatstack.dev", password: "101" } }
  let(:company) { create :company }

  describe "POST /create" do
    context "with valid parameters" do
      before do
        post registrations_url(subdomain: company.slug), params: { user: valid_attributes }
      end

      it "creates a new user" do
        expect(User.count).to eq 1
      end

      it "redirects to the blog page" do
        expect(response).to redirect_to(root_url)
      end
    end

    context "with invalid parameters" do
      let(:invalid_attributes) { { first_name: "" } }

      before do
        post registrations_url(subdomain: company.slug), params: { user: invalid_attributes }
      end

      it "doesn't create a new user" do
        expect(User.count).to be_zero
      end

      it "renders a successful response" do
        expect(response).to be_successful
      end
    end
  end
end
