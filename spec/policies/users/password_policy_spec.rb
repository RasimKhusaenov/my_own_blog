require "rails_helper"

RSpec.describe Users::PasswordPolicy do
  let(:policy) { described_class.new(user: current_user) }
  let(:current_user) { build_stubbed(:user, :reader) }

  %i[edit? update?].each do |policy_method|
    describe "##{policy_method}" do
      subject { policy.apply(policy_method) }

      it { is_expected.to be_truthy }
    end
  end
end
