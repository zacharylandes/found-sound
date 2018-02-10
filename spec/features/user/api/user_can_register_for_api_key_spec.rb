describe "As a logged in user" do
  describe "when I visit my dashboard I see a link for developer" do
    it "I can register to recieve an API key" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit dashboard_index_path

      click_on "Developer"
      expect(current_path).to eq("/settings/developer")
      expect(page).to have_button("Register")

      click_on "Register"
      expect(current_path).to eq("/settings/developer")
      expect(page).to_not have_button("Register")

      expect(page).to have_content("Your Key:")
      expect(page).to have_css(".key")
    end
  end
end
