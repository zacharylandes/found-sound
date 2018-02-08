require 'rails_helper'

RSpec.feature "Admin Stores" do
  before(:each) do
    admin = create(:admin)
    create(:store, status: "active")
    create(:store, status: "pending")
    create(:store, status: "suspended")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  end


  it "As an admin I can see all stores divided by status" do

    visit admin_dashboard_index_path

    click_on "Stores"

    expect(current_path).to eq(admin_stores_path)
    expect(page).to have_content("Active")
    expect(page).to have_content("Pending")
    expect(page).to have_content("Suspended")

  end
end
