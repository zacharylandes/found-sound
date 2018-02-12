class OrderCreator

  def initialize(order)
    @order = order
    @stores =  @order.items.map {|item| Store.find(item.store_id)}
  end

  def create_store_order
     @stores.map do |store|
        so = StoreOrder.create(store_id: store.id, order_id: @order.id)
        items=  @order.items.where(store_id:store.id)
        ois = OrderItem.where(item_id: items).where(order_id:@order.id)
        so.order_items << ois

        so.update_attributes(total_price: price(ois))
        store.store_orders << so
      end
  end

  def price(order_items)
    order_items.reduce(0) do |acc,orderitem|
      acc += (orderitem.item.price * orderitem.quantity)
      acc
    end
  end

end
