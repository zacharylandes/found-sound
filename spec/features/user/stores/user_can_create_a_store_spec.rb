require 'rails_helper'

describe ' a logged in user' do
  describe 'user visits stores/new' do
    it 'can create a store' do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit 'stores/new'
      fill_in 'store[name]', with: "Vandelay-Industries"
      fill_in 'store[address]', with: "454 Russell st winters ca 95694"

      click_on "Submit"

      expect(current_path).to eq(dashboard_index_path)
      expect(Store.count).to eq(1)
      expect(page).to have_content("My Stores")

      click_on "My Stores"

      expect(current_path).to eq(stores_path)
      expect(page).to have_content("Vandelay-Industries")
      expect(page).to have_content("Pending")
    end
    it 'can click the store button from the my stores tab to create a store' do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit dashboard_index_path

      click_on 'My Stores'
      click_on 'Create New Store'

      expect(current_path).to eq(new_store_path)
    end
  end
end
