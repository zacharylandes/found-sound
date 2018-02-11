require 'rails_helper'

describe 'a store admin I do not have access to platform admin details' do
    let(:store_manager) { create(:user)}
    let(:user_2) { create(:user)}

    let!(:store_1) { create(:store, name:"found-sound")}
    let!(:store_2) { create(:store, name:"sound-hound")}

    let(:item) { create(:item, store_id: store)}

    let(:user_store) { create(:user_store, store_id: store_manager, user_id:user_1)}
    let(:user_store) { create(:user_store, store_id: store_2, user_id:user_2)}


    before(:each) do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(store_manager)
    end

    it 'cannot view platform admin dashboard' do

      expect{ visit admin_dashboard_index_path }.to raise_error(ActionController::RoutingError)
    end

    it 'cannot view platform admin analytics' do

      expect{ visit admin_analytics_path }.to raise_error(ActionController::RoutingError)
    end

    it 'cannot view store edit path' do

      expect{ visit edit_store_path(store_1)}.to raise_error(ActionController::RoutingError)
    end

    it 'cannot update employees' do

      expect{ visit employees_path(store_1)}.to raise_error(ActionController::RoutingError)
    end

    it 'cannot view another stores items or orders' do

      expect{     visit '/sound-hound/manage'}.to raise_error(ActionController::RoutingError)


    end


end
