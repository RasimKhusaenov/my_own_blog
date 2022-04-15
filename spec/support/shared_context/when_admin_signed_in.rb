RSpec.shared_context "when admin signed in" do
  include_context "when user signed in"

  let(:role) { :admin }
end
