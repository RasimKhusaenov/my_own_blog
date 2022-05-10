require "rails_helper"

RSpec.describe "Feedback", type: :request do
  let(:valid_attributes) { attributes_for(:feedback) }
  let(:invalid_attributes) { attributes_for(:feedback, email: "not_correct") }

  describe "GET /new" do
    it "renders a successful response" do
      get new_feedback_path

      expect(response).to be_successful
      expect(CGI.unescapeHTML(response.body)).to include("Write down what's bothering you.")
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

    context "with invalid parameters" do
      before do
        post feedback_path, params: { feedback: invalid_attributes }
      end

      it "renders a successful response" do
        expect(response).to be_successful
      end

      it "doesn't redirect" do
        expect(response).not_to have_http_status(:redirect)
      end
    end
  end
end
