require "rails_helper"

RSpec.describe User, type: :model do
  subject(:user) { described_class.new(first_name: "Rasim", email: "rasim.khusaenov@flatstack.dev", password: "101") }

  describe "validations" do
    it "is valid with valid attributes" do
      expect(user).to be_valid
    end

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.not_to validate_presence_of(:last_name) }
    it { is_expected.to have_secure_password }
  end
end
