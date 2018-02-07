require 'rails_helper'

RSpec.feature "Admin Stores" do
  let(:admin) { create(:admin) }
  let(:active_store){create(:store,status: "active")}
  let(:pending_store){create(:store,status: "pending")}
  let(:suspended_store){create(:store,status: "suspended")}

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  end


  xit "As an admin I can see all stores divided by status" do
    vist 'admin_dashboard_index_path'


  end
end
