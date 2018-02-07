class CartDecorator < SimpleDelegator

  def cart_items
    contents.keys.map {|id| Item.find(id.to_i)}
  end

  def quantity_of(item_id)
    contents[item_id.to_s]
  end

  def subtotal(item)
    item.price * quantity_of(item.id)
  end

  def total
    cart_items.map {|item| subtotal(item)}.sum
  end

end
