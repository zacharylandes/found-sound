require 'rails_helper'

describe "As a store admin " do
  context "I visit store edit page" do
    it "I can update store info" do
      store_admin= create(:user)
      store = create(:store)
      user_store = create(:user_store, user: store_admin, store: store, user_type: 1)
      item1, item2, item3 = create_list(:item, 3, store: store)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(store_admin)

      visit dashboard_index_path

      click_on "My Stores"
      save_and_open_page
      click_on "Manage Store"
      expect(current_path).to eq ("/#{store.slug}/manage")

      fill_in "store[name]", :with => "A Great Store"

      click_on "Submit"
      


    end
  end
end
