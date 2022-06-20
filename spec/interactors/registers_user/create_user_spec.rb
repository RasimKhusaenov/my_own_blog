require "rails_helper"

RSpec.describe RegistersUser::CreateUser do
  include_context "with interactor"

  let(:initial_context) { { user_params: user_params } }

  let(:user_params) { { first_name: "Rasim", email: "rasim.khusaenov@flatstack.dev", password: "101" } }
  let(:expected_user_params) do
    {
      email: "rasim.khusaenov@flatstack.dev"
    }
  end

  it "creates user" do
    expect { interactor.run }.to change(User, :count).by(1)

    expect(context.user).to have_attributes(expected_user_params)
  end

  context "with invalid params" do
    let(:user_params) { { first_name: nil } }

    it "failures" do
      interactor.run

      expect(context).to be_failure
    end

    it "doesn't create user" do
      expect { interactor.run }.not_to change(User, :count)
    end
  end
end
