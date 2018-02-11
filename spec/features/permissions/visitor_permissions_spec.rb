require 'rails_helper'

describe 'as a visitor I do not have access to store permissions' do
    let!(:user) { create(:user)}
    let!(:store) { create(:store, name:"found-sound", slug:"found-sound")}
    let(:item) { create(:item, store_id: store)}

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

    it 'cannot see all orders 'do

        visit "/found-sound?tab=order"

      expect(current_path).to eq(store_path(store.slug))

      expect{ visit orders_path}.to raise_error(ActionController::RoutingError)
    end

    it 'cannot crud user 'do
      expect{ visit logout_path}.to raise_error(ActionController::RoutingError)
      expect{ visit signout_path}.to raise_error(ActionController::RoutingError)




      expect{ visit user_path(user)}.to raise_error(ActionController::RoutingError)


    end

    it 'cannot visit dashboard_index_path' do

      expect{ visit dashboard_index_path}.to raise_error(ActionController::RoutingError)
    end

end
