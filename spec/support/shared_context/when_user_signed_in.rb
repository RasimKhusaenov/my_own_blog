RSpec.shared_context "when user signed in" do
  let(:current_user_attributes) { attributes_for(:user) }

  before do
    create(:user, **current_user_attributes)

    visit new_session_path

    fill_in "Email", with: current_user_attributes[:email]
    fill_in "Password", with: current_user_attributes[:password]

    click_button "Sign In"
  end
end
