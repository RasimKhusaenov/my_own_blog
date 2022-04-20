RSpec.shared_context "when admin signed in (controllers)" do
  include_context "when user signed in (controllers)"

  let(:role) { :admin }
end
