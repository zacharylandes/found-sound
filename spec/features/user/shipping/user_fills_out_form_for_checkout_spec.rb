require 'rails_helper'


describe "when a user checks out an order" do
  context "the are shown a form to fill out address" do
    it "should create an order with their shipping address and show rates" do
      VCR.use_cassette("shipment object response") do
        user = create(:user)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        item1, item2, item3 = create_list(:item, 3)

        visit store_path(item1.store.slug)

        click_on "Add to cart"
        click_on "Add to cart"

        visit cart_path

        click_on "Checkout"

        expect(current_path).to eq(shipping_path)

        expect(page).to have_content("Shipping Address")
        fill_in "shipping[street]", with: "944 s quitman st"
        fill_in "shipping[city]", with: "Denver"
        fill_in "shipping[state]", with: "CO"
        fill_in "shipping[zip]", with: "80219"
        fill_in "shipping[country]", with: "US"
        fill_in "shipping[phone]", with: "3031234567"

        click_on "Submit"

        within ".rates" do
          expect(page).to have_css(".rate", count: 3)
          expect(page).to have_content("Carrier")
          expect(page).to have_content("Estimated Delivery Time")
          expect(page).to have_content("Price")
        end
      end
    end
  end
end
