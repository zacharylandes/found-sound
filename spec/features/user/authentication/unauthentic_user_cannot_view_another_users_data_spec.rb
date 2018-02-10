require 'rails_helper'

RSpec.feature "Unauthenticated users security" do
  let(:user_1) {create(:user, first_name: "Mimi", last_name: "Le", email: "mimi@mimi.com", password: "mimi")}
  let(:user_2) {create(:user, first_name: "Jake", last_name: "the Dog", email: "jake@adventuretime.com", password: "dog")}
  let(:order) {create(:order, status: "ordered", user: user_1)}

  context "As an unauthenticated user" do
    it "I cannot view another user’s private data" do
      expect{ visit dashboard_index_path}.to raise_error(ActionController::RoutingError)

      expect {
        visit order_path(order)
      }.to raise_exception(ActionController::RoutingError)
    end

    it "I should be redirected to login/create account when I try to check out" do
      unicorn_onesie_1 = create(:item)

      visit item_path(unicorn_onesie_1)

      click_on "Add to cart"

      click_on "Cart"

      expect(page).to_not have_content("Checkout")
    end

    it "I cannot view the administrator screens or use administrator functionality" do
      expect {
        visit admin_dashboard_index_path
      }.to raise_exception(ActionController::RoutingError)
    end
  end
end
