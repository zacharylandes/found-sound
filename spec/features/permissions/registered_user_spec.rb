require 'rails_helper'

describe 'a registered user I do not have access to store permissions' do
    let(:user) { create(:user)}
    let!(:store) { create(:store, name:"found-sound")}
    let(:item) { create(:item, store_id: store)}


    before(:each) do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end

    it 'cannot view platform admin dashboard' do

      expect{ visit admin_dashboard_index_path }.to raise_error(ActionController::RoutingError)
    end

    it 'cannot view platform admin analytics' do

      expect{ visit admin_analytics_path }.to raise_error(ActionController::RoutingError)
    end

    it 'cannot view store edit path' do

      expect{ visit edit_store_path(store)}.to raise_error(ActionController::RoutingError)
    end

    it 'cannot update employees' do

      expect{ visit employees_path(store)}.to raise_error(ActionController::RoutingError)

    end

    it 'cannot crud store items' do

      expect{ visit new_admin_item_path}.to raise_error(ActionController::RoutingError)
      expect{ visit edit_admin_item_path(item)}.to raise_error(ActionController::RoutingError)
      expect{ visit admin_item_path(item)}.to raise_error(ActionController::RoutingError)
    end





end
