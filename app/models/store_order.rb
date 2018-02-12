class StoreOrder < ApplicationRecord
  belongs_to :order
  belongs_to :store

  has_many :store_order_order_items
  has_many :order_items, through: :store_order_order_items

end
