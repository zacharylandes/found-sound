require 'rails_helper'


describe "when a user checks out an order" do
  context "the are shown a form to fill out address" do
    it "should create an order with their shipping address and show rates" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      # oi1 = create(:order_item, item: item1, order: order)
      # oi2 = create(:order_item, item: item2, order: order)
      # oi3 = create(:order_item, item: item3, order: order)
      item1, item2, item3 = create_list(:item, 3)

      visit store_path(item1.store.slug)

      click_on "Add to cart"
      click_on "Add to cart"

      visit cart_path
      # binding.pry
      save_and_open_page
      click_on "Checkout"

      expect(current_path).to eq(new_order_path)

      expect(page).to have_content("Fill in shipping address")
      fill_in "street", with: "944 s quitman st"
      fill_in "city", with: "Denver"
      fill_in "state", with: "CO"
      fill_in "zip", with: "80219"
      fill_in "country", with: "US"
      fill_in "phone", with: "3031234567"

      click_on "Submit"

      within ".rates" do
        expect(page).to have_css(".rate", count: 3)
        expect(page).to have_content("carrier")
        expect(page).to have_content("delivery days")
      end

      within(first(".rate")) do
        click_on "Select"
      end

      expect(current_path).to eq

    end
  end
end
