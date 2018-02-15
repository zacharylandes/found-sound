require 'rails_helper'

RSpec.feature "User can checkout with stripe" do
  it "and see the message 'order was successfully placed'" do
    VCR.use_cassette("shipment response") do
      user = create(:user, first_name: "Tester", last_name: "McTesty", email: "testerson@testmail.com", password: "testing", address: "dummy address")
      item1, item2, item3 = create_list(:item, 3)
      visit store_path(item1.store.slug)

      click_on "Add to cart"

      visit cart_path

      within(".checkout") do
        click_on("Login")
      end

      fill_in "session[email]", with: "testerson@testmail.com"
      fill_in "session[password]", with: "testing"

      within(".action") do
        click_on("Login")
      end

      click_on "Cart"
      click_on 'Checkout'

      expect(current_path).to eq(shipping_path)

      fill_in "shipping[street]", with: "944 s quitman st"
      fill_in "shipping[city]", with: "Denver"
      fill_in "shipping[state]", with: "CO"
      fill_in "shipping[zip]", with: "80219"
      fill_in "shipping[country]", with: "US"
      fill_in "shipping[phone]", with: "5555555555"
      click_on "Submit"

      within(first(".rate")) do
        click_on "Select"
      end

      expect(current_path).to eq(new_order_path)
      expect(page).to have_content("32.98")
    end
  end
end
