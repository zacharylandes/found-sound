require 'rails_helper'

describe 'as a registered_user'do

  let!(:user){create(:user)}
  let!(:admin){create(:user)}
  let!(:admin_2){create(:user)}
  let(:department) {create(:department, title: "books")}
  let!(:thrillers) {create(:category, title: "thrillers")}
  let!(:store_1){create(:store, name: "this_store", status:"active", slug: "this_store")}
  let!(:store_2){create(:store, name: "that_store", status:"active", slug: "that_store")}
  let!(:user_store) {create(:user_store, user: admin_2, store: store_2, user_type: 0)}
  let!(:item_2){create(:item, store: store_2, category_id: thrillers.id, price: 5.00 )}
  let!(:item_3){create(:item, store: store_2, category_id: thrillers.id, price: 10.00 )}
  let!(:item_1){create(:item, store: store_1, category_id: thrillers.id, price: 15.00 )}
  let!(:item_4){create(:item, store: store_1, category_id: thrillers.id, price: 5.00 )}


  describe 'when I click checkout' do
    it 'shouldnt matter which store I checkout from' do
    user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit departments_department_path(department.slug)

        #add item_2 to cart
        within(:xpath, '(//div[@class="card-body"])[1]') do
                click_on "Add to cart"
        end
        #add item_3 to cart
        within(:xpath, '(//div[@class="card-body"])[2]') do
                click_on "Add to cart"
        end
        #add item_1 to cart
        within(:xpath, '(//div[@class="card-body"])[3]') do
                click_on "Add to cart"
        end
        #add item_4 to cart
        within(:xpath, '(//div[@class="card-body"])[4]') do
                click_on "Add to cart"
        end

        click_on "Cart"


        click_on "Checkout"


      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin_2)

      visit dashboard_index_path

      click_on "My Stores"
      click_on "#{store_2.name}"
      click_on "Orders"

      within ".order-id" do
        first(:link).click
      end


      expect(StoreOrder.first.total_price).to eq(15)
      expect(page).to have_content(15)

    end

    it 'shows only orders for a different store' do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      create(:user_store, user: admin, store: store_1, user_type: 0)

      visit departments_department_path(department.slug)

      #add item_2 to cart
      within(:xpath, '(//div[@class="card-body"])[1]') do
              click_on "Add to cart"
      end
      #add item_3 to cart
      within(:xpath, '(//div[@class="card-body"])[2]') do
              click_on "Add to cart"
      end
      #add item_1 to cart
      within(:xpath, '(//div[@class="card-body"])[3]') do
              click_on "Add to cart"
      end
      #add item_4 to cart
      within(:xpath, '(//div[@class="card-body"])[4]') do
              click_on "Add to cart"
      end

      click_on "Cart"


      click_on "Checkout"


      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit dashboard_index_path

      click_on "My Stores"
      click_on "#{store_1.name}"
      click_on "Orders"

      within ".order-id" do
        first(:link).click
      end

      expect(page).to have_content(20)
      expect(StoreOrder.last.total_price).to eq(20)
    end
  end
end
