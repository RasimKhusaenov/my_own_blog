require "rails_helper"

RSpec.describe CreateCompany do
  include_context "with interactor"

  describe ".call" do
    let(:initial_context) { { company_params: company_params } }

    let(:company_params) do
      {
        official_name: "Khusaenov Industries",
        owner: user
      }
    end
    let(:expected_company_params) do
      {
        official_name: "Khusaenov Industries"
      }
    end
    let(:user) { create :user }

    it "creates company" do
      expect { interactor.run }.to change(Company, :count).by(1)

      expect(context.company).to have_attributes(expected_company_params)
    end

    it "creates company member" do
      expect { interactor.run }.to change(CompanyMember, :count).by(1)
    end
  end
end
