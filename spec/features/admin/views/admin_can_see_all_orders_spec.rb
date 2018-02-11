require 'rails_helper'

RSpec.feature "Admin Orders" do
  let(:admin) { create(:admin) }

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  end

  context "As an admin and two orders in the database" do
    let!(:order_1) { create(:order, status: "ordered") }
    let!(:order_2) { create(:order) }

    xit "I can see the total number of orders for each status" do
    end

    it "I can see all orders with associated attributes" do
      visit admin_dashboard_index_path

      expect(page).to have_content(order_1.id)
      expect(page).to have_content(order_1.date)
      expect(page).to have_content(order_1.status.capitalize)
      expect(page).to have_content(order_1.total_price)
      expect(page).to have_content(order_2.total_price)
    end

    it "I can see orders filtered by status" do
      visit admin_dashboard_index_path

      click_on("Ordered")

      expect(current_path).to eq(admin_dashboard_index_path)
      expect(page).to have_link(order_1.id, href: order_path(order_1))
      expect(page).not_to have_link(order_2.id)
    end
  end
end
