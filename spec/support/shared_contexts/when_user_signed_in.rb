RSpec.shared_context "when user signed in" do
  let(:current_user) { create(:user, first_name: "John", email: "john.smith@test.com", password: "pwd", role: role) }
  let(:role) { :reader }

  before do
    visit new_session_path

    fill_in "Email", with: current_user.email
    fill_in "Password", with: current_user.password

    click_button "Sign In"
  end
end
