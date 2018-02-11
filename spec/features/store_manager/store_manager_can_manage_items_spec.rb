require 'rails_helper'

describe "As a store manager" do
  context "when I visit my dashboard" do
    context "I can see a tab for My Items" do
      it "can click on My Items and see all items in my store" do
        store_manager = create(:user)
        store = create(:store)
        user_store = create(:user_store, user: store_manager, store: store, user_type: 0)
        item1, item2, item3 = create_list(:item, 3, store: store)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(store_manager)

        visit dashboard_index_path
        click_on "My Stores"
        click_on "#{store.name}"

        expect(current_path).to eq "/#{store.slug}"
        expect(page).to have_content(item1.title)
        expect(page).to have_content(item2.title)
        expect(page).to have_content(item3.title)
      end
      it "can click on My Items and see all items in my store" do
        store_manager = create(:user)
        store = create(:store)
        user_store = create(:user_store, user: store_manager, store: store, user_type: 0)
        item1, item2, item3 = create_list(:item, 3, store: store)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(store_manager)

        visit dashboard_index_path
        click_on "My Stores"
        click_on "#{store.name}"

        expect(current_path).to eq "/#{store.slug}"
        expect(page).to have_content(item1.title)
        expect(page).to have_content(item2.title)
        expect(page).to have_content(item3.title)
      end
    end
  end
end
