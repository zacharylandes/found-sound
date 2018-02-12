class StoreOrderOrderItem < ApplicationRecord
  belongs_to :store_order
  belongs_to :order_item
end
