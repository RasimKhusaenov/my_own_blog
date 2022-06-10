require "rails_helper"

RSpec.describe CreatesCompany::Create do
  include_context "with interactor"

  let(:initial_context) { { company_params: company_params } }

  let(:company_params) { { official_name: "Khusaenov Industries" } }
  let(:expected_company_params) do
    {
      official_name: "Khusaenov Industries"
    }
  end

  it "creates company" do
    expect { interactor.run }.to change(Company, :count).by(1)

    expect(context.company).to have_attributes(expected_company_params)
  end

  context "with invalid params" do
    let(:company_params) { { official_name: nil } }

    it "failures" do
      interactor.run

      expect(context).to be_failure
    end

    it "doesn't create company" do
      expect { interactor.run }.not_to change(Company, :count)
    end
  end
end
