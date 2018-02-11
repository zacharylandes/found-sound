require 'rails_helper'

describe "As a store admin" do
  context "when I visit one of my store show pages" do
    it "can click on link to create a new item" do
      store_admin = create(:user)
      store = create(:store)
      user_store = create(:user_store, user: store_admin, store: store, user_type: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(store_admin)

      visit store_path(store.slug)
      click_on "Items"
      click_on "Make New Item"

      expect(current_path).to eq new_store_item_path(store.slug)

      fill_in "item[title]", with: "NEW ITEM"
      fill_in "item[description]", with: "NEW DESCRIPTION"
      fill_in "item[price]", with: 30.00
      select "active", from: "item[condition]"
      click_on "Submit"

      expect(current_path).to eq store_path(store.slug)
      expect(page).to have_content "NEW ITEM"
      expect(page).to have_content "NEW DESCRIPTION"
      expect(page).to have_content 30.00
    end
  end
end
