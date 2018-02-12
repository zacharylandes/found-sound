require 'rails_helper'

describe 'as a registered_user'do

  let!(:user){create(:user)}
  let!(:admin){create(:user)}
  let!(:admin_2){create(:user)}
  let!(:store_1){create(:store, name: "this_store", status:"active", slug: "this_store")}
  let!(:user_store) {create(:user_store, user: admin, store: store_1, user_type: 0)}
  let!(:thrillers) {create(:category, title: "thrillers")}
  let!(:store_2){create(:store, name: "that_store", status:"active", slug: "that_store")}
  let!(:user_store) {create(:user_store, user: admin_2, store: store_2, user_type: 0)}
  let!(:item_1){create(:item, store: store_1, category_id: thrillers.id)}
  let!(:item_2){create(:item, store: store_2, category_id: thrillers.id)}
  let!(:item_3){create(:item, store: store_2, category_id: thrillers.id)}
  let!(:item_4){create(:item, store: store_1, category_id: thrillers.id)}


  describe 'when I click checkout' do
    it 'shouldnt matter which store I checkout from' do

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/categories/thrillers'

      within first '.card-body' do
        click_on "Add to cart"
        end

      visit '/categories/thrillers'

        within(:xpath, '(//div[@class="card-body"])[last()]') do
                click_on "Add to cart"
        end
        within(:xpath, '(//div[@class="card-body"])[1]') do
                click_on "Add to cart"
        end

        click_on "Cart"

        click_on "Checkout"

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit '/this_store'

        expect(page).to have_content(item_1.title)
        expect(page).to_not have_content(item_2.title)
        save_and_open_page
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin_2)

        visit '/that_store'

        expect(page).to have_content(item_2.title)
        expect(page).to_not have_content(item_1.title)
    end
  end
end
