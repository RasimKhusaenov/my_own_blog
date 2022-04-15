require "rails_helper"

RSpec.describe ArticlePolicy do
  subject { described_class.new(user, Article) }

  context "when user is superadmin" do
    let(:user) { create(:user, :superadmin) }

    it { is_expected.to permit_action(%i[create]) }
  end

  context "when user is admin" do
    let(:user) { create(:user, :admin) }

    it { is_expected.to permit_action(%i[create]) }
  end

  context "when user is reader" do
    let(:user) { create(:user, :reader) }

    it { is_expected.to forbid_action(%i[create]) }
  end
end
