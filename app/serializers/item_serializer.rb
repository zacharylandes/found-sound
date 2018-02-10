class ItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :price

  def price
    "$#{'%.2f' % object.price}"
  end
end
