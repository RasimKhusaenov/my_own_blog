require "rails_helper"

RSpec.describe UserDecorator do
  let(:user) { create(:user, first_name: "Rasim", last_name: "") }

  describe "#full_name" do
    subject { described_class.new(user).full_name }

    context "when no last name" do
      it { is_expected.to eq("Rasim") }
    end

    context "when all names" do
      before do
        user.last_name = "Khusaenov"
      end

      it { is_expected.to eq("Rasim Khusaenov") }
    end
  end
end
