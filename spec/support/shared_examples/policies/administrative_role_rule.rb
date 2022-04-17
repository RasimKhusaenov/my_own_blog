RSpec.shared_examples "administrative role rule" do
  let(:policy) { described_class.new(record, user: current_user) }

  context "when current user is superadmin" do
    let(:current_user) { build_stubbed(:user, :superadmin) }

    it { is_expected.to be_truthy }
  end

  context "when current user is admin" do
    let(:current_user) { build_stubbed(:user, :admin) }

    it { is_expected.to be_truthy }
  end

  context "when current user is reader" do
    let(:current_user) { build_stubbed(:user, :reader) }

    it { is_expected.to be_falsey }
  end
end
