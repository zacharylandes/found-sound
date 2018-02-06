class CartDecorator < SimpleDelegator

  def cart_items
    contents.keys.map {|id| Item.find(id.to_i)}
  end

  def quantity_of(item_id)
    contents[item_id.to_s]
  end

end
