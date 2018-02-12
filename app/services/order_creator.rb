class OrderCreator

  def initialize(order, user)
    @order = order
    @user = user
    @stores =  @order.items.map {|item| Store.find(item.store_id)}
  end

  def create_store_order
     @stores.map do |store|
        so = StoreOrder.create(store_id: store.id, order_id: @order.id)
        items=  @order.items.where(store_id:store.id)
        ois = OrderItem.where(item_id:items).where(order_id:@order.id)
        so.order_items << ois
        so.update_attributes(total_price: price(ois))
        store.store_orders << so
      end
  end

    def price(order_items)
      order_items.reduce(0) do |acc,orderitem|
        acc += (orderitem.item.price * orderitem.quantity)
      end
    end

end
#
# end
#       # stores.map {|store|StoreOrder.create(store_id:store, order_id:@order.id, status:@order.status,
#       #   total_price:Orderitem.)}

    #  @cart.each do |item,quantity|
    #
    #   OrderItem.create(item_id: Item.find(item).id, quantity:quantity)}
    #
    # end
    # Order.create(status: "ordered", user_id: current_user.id)
