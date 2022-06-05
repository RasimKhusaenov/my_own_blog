require "rails_helper"

RSpec.describe CreateCompany do
  include_context "with interactor"

  describe ".call" do
    let(:initial_context) { { company_params: company_params, user: user } }

    let(:company_params) { { official_name: "Khusaenov Industries" } }
    let(:expected_company_params) do
      {
        official_name: "Khusaenov Industries"
      }
    end
    let(:company) { create :company }
    let(:user) { create :user }

    it "creates company" do
      expect { interactor.run }.to change(Company, :count).by(1)

      expect(context.company).to have_attributes(expected_company_params)
    end

    it "creates company member" do
      expect { interactor.run }.to change(CompanyMember, :count).by(1)
    end

    it "adds user to company as owner" do
      interactor.run

      role = CompanyMember.find_by(company: context.company, user: user).role
      expect(role).to be_owner
    end
  end
end
