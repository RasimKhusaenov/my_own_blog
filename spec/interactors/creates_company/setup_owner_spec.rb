require "rails_helper"

RSpec.describe CreatesCompany::SetupOwner do
  include_context "with interactor"

  let(:initial_context) { { company: company, user: user } }

  let(:company) { create :company }
  let(:user) { create :user }

  context "with valid user and company" do
    it "creates company member" do
      expect { interactor.run }.to change(CompanyMember, :count).by(1)
    end

    it "adds user to company as owner" do
      interactor.run

      role = CompanyMember.find_by(company: company, user: user).role
      expect(role).to be_owner
    end
  end

  context "with invalid params" do
    let(:user) { nil }

    it "failures" do
      interactor.run

      expect(context).to be_failure
    end

    it "doesn't create company member" do
      expect { interactor.run }.not_to change(CompanyMember, :count)
    end
  end
end
