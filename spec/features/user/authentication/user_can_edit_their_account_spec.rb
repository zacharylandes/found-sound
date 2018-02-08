describe "As a logged in User" do
  describe "I can visit account/edit and update my info" do
    it "I can update my info without entering my password" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/account/edit"

      fill_in :user_first_name, with: "George Oscar Bluth"

      click_on "Submit"

      expect(current_path).to eq("/account/edit")
      expect(page).to have_selector("input[value='George Oscar Bluth']")
      expect(page).to have_content("Successfully updated your account information.")
    end
  end
end
