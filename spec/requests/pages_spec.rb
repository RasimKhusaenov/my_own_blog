require "rails_helper"

RSpec.describe "Registrations", type: :request do
  describe "GET /about" do
    it "renders a successful response" do
      get pages_about_path
      expect(response).to be_successful
    end
  end
end
