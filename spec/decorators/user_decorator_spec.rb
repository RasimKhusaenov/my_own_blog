require "rails_helper"

RSpec.describe UserDecorator do
  let(:user) { create(:user, first_name: "Rasim", last_name: last_name) }
  let(:last_name) { nil }

  describe "#full_name" do
    subject { described_class.new(user).full_name }

    context "when no last name" do
      it { is_expected.to eq("Rasim") }
    end

    context "when all names" do
      let(:last_name) { "Khusaenov" }

      it { is_expected.to eq("Rasim Khusaenov") }
    end
  end
end
