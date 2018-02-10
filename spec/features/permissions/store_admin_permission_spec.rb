require 'rails_helper'

describe 'a store admin I do not have access to platform admin details' do
    let(:store_admin) { create(:user)}
    let(:store) { create(:store, name:"found-sound")}

    before(:each) do
      user_store = create(:user_store, user: store_admin, store: store, user_type: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(store_admin)
    end

    it 'cannot view platform admin dashboard' do

      expect{ visit admin_dashboard_index_path }.to raise_error(ActionController::RoutingError)
    end

    it 'cannot view platform admin analytics' do

      expect{ visit admin_analytics_path }.to raise_error(ActionController::RoutingError)
    end



end
