require "rails_helper"

RSpec.describe Users::MePolicy do
  %i[show? edit? update?].each do |policy_method|
    describe "##{policy_method}" do
      subject { policy.apply(policy_method) }

      it { is_expected.to be_truthy }
    end
  end
end
