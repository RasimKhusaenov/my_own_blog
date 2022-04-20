RSpec.shared_context "when user signed in (controllers)" do
  let!(:user) { create(:user, first_name: "John", email: "john.smith@test.com", password: "pwd", role: role) }
  let(:role) { :reader }

  before do
    post session_path, params: { user: { email: user.email, password: user.password } }
  end
end
