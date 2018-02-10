require 'rails_helper'

describe "As a store admin" do
  let(:store_manager) { create(:user)}
  let(:store_admin) { create(:user)}
  let(:store_admin_2) { create(:user)}

  before(:each) do
  store_admin = create(:user)
  store = create(:store, name:"found-sound")
  user_store = create(:user_store, user: store_manager, store: store, user_type: 0)
  user_store = create(:user_store, user: store_admin, store: store, user_type: 1)
  user_store = create(:user_store, user: store_admin_2, store: store, user_type: 1)

  item1, item2, item3 = create_list(:item, 3, store: store)
  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(store_admin)
end

  context "when I visit my dashboard" do
    context " I  click on my stores" do
    context "I click on manage store " do
      it "can update store info" do

        visit "/found-sound/manage"


        fill_in "name", :with => "A Cool Spot"
        fill_in "address", :with => "A bad  Spot"

        click_on "Submit"

        expect(current_path).to eq( "/a-cool-spot/manage")

       end
        it "can update permissions for store managers" do

          visit "/found-sound/manage"

          click_on  "Change to Store Admin"

          expect(current_path).to eq( "/found-sound/manage")
          expect(store_manager.user_stores.first.user_type).to eq("store_admin")
         end
        it "can update permissions for store managers" do
          visit "/found-sound/manage"

          click_on  "Change to Store Manager"

          expect(current_path).to eq( "/found-sound/manage")
          expect(store_admin_2.user_stores.first.user_type).to eq("store_manager")
         end
      end
    end
  end
end
