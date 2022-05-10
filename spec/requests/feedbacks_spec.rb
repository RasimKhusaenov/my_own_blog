require "rails_helper"

RSpec.describe "Feedback", type: :request do
  let(:valid_attributes) { attributes_for(:feedback) }

  describe "GET /new" do
    it "renders a successful response" do
      get new_feedback_path

      expect(response).to be_successful
      expect(response.body).to include("Write down what's bothering you.")
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      before do
        post feedback_path, params: { feedback: valid_attributes }
      end

      it "redirects to the blog page" do
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
