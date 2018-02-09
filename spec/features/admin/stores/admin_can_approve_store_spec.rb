require 'rails_helper'

RSpec.feature "Admin Stores" do
  before(:each) do
    admin = create(:admin)
    create(:store,name:"store_1", status: "active")
    create(:store, name:"store_2", status: "pending")
    create(:store, name: "store_3", status: "suspended")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  end


  it "As an admin I can approve a pending store  " do

    visit admin_dashboard_index_path

    click_on "Stores"

    expect(current_path).to eq(admin_stores_path)
    expect(page).to have_content("store_2")
    expect(page).not_to have_content("store_3")


  end

  it "As an admin I can see all stores divided by status" do

    visit admin_dashboard_index_path

    click_on "Stores"

    expect(current_path).to eq(admin_stores_path)
    expect(page).to have_content("Active")
    expect(page).to have_content("Pending")
    expect(page).to have_content("Suspended")

  end
  it "As an admin I can click on active stores" do

    visit admin_dashboard_index_path

    click_on "Stores"

    click_on "Active"

    expect(current_path).to eq(admin_stores_path)
    expect(page).to have_content("Active")
    expect(page).not_to have_content("#{Store.second.name}")
    expect(page).not_to have_content("#{Store.last.name}")

  end
  it "As an admin I can click on active stores" do

    visit admin_dashboard_index_path

    click_on "Stores"

    click_on "Suspended"

    expect(current_path).to eq(admin_stores_path)
    expect(page).to have_content("Suspended")
    expect(page).not_to have_content("#{Store.second.name}")
    expect(page).not_to have_content("#{Store.first.name}")

  end
end
