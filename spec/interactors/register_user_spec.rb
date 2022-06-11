require "rails_helper"

RSpec.describe RegisterUser do
  include_context "with interactor"

  describe ".call" do
    let(:initial_context) { { user_params: user_params, company: company } }

    let(:user_params) { { first_name: "Rasim", email: "rasim.khusaenov@flatstack.dev", password: "101" } }
    let(:expected_user_params) do
      {
        email: "rasim.khusaenov@flatstack.dev"
      }
    end
    let(:company) { create :company }
    let(:user) { create :user }

    it "creates user" do
      expect { interactor.run }.to change(User, :count).by(1)

      expect(context.user).to have_attributes(expected_user_params)
    end

    it "creates company member" do
      expect { interactor.run }.to change(CompanyMember, :count).by(1)
    end

    it "adds user to company as owner" do
      interactor.run

      role = CompanyMember.find_by(company: company, user: context.user).role
      expect(role).to be_writer
    end
  end
end
