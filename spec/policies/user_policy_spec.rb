require "rails_helper"

RSpec.describe UserPolicy do
  subject { described_class.new(user, current_user) }

  let(:current_user) { nil }

  context "when user isn't present" do
    let(:user) { nil }

    it { is_expected.not_to permit_action(:show) }
  end

  context "when user is present" do
    let(:user) { create(:user) }

    it { is_expected.to permit_action(:show) }
  end
end
