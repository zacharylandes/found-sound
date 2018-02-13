require 'rails_helper'

describe 'as a registered_user'do

  let!(:admin){create(:user)}
  let!(:admin_2){create(:user)}
  let(:department) {create(:department, title: "books")}
  let!(:thrillers) {create(:category, title: "thrillers", department: department)}
  let!(:store_1){create(:store, name: "this_store", status:"active", slug: "this_store")}
  let!(:store_2){create(:store, name: "that_store", status:"active", slug: "that_store")}
  let!(:user_store) {create(:user_store, user: admin_2, store: store_2, user_type: 0)}

  describe 'when I click checkout' do

    it 'shouldnt matter which store I checkout from' do
      user = create(:user)
      item_2 = create(:item, id:2, store: store_2, category_id: thrillers.id, price: 5.00 )
      item_3 = create(:item, id:3, store: store_2, category_id: thrillers.id, price: 10.00 )
      item_1 = create(:item, id:1, store: store_1, category_id: thrillers.id, price: 15.00 )
      item_4 = create(:item, id:4, store: store_1, category_id: thrillers.id, price: 5.00 )
      order =  create(:order, status: "ordered", user: user)

      cart = CartDecorator.new( Cart.new({"1"=>1, "2"=>1, "3"=>1, "4"=>1}))
      order.add(cart)

      OrderCreator.new(order).create_store_order
      expect(StoreOrder.first.total_price).to eq(15)
      expect(StoreOrder.last.total_price).to eq(20)
    end
  end
end
