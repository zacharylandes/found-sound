require 'rails_helper'

describe "As a store admin" do
  context "can visit a store show page" do
    it "and click on My Orders and can edit and individual order" do
      store_admin = create(:user)
      store = create(:store)
      user_store = create(:user_store, user: store_admin, store: store, user_type: 1)
      item1 = create(:item, store: store)
      order1 = create(:order)
      order1.items << item1
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(store_admin)

      visit store_path(store.slug)

      click_on "Orders"

      select "cancelled", from: "order[status]"

      click_on "Change Status"

      expect(page).to have_content "cancelled"
    end
  end
end
