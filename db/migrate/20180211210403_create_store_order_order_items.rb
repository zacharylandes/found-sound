class CreateStoreOrderOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :store_order_order_items do |t|
      t.references :store_order, foreign_key: true
      t.references :order_item, foreign_key: true

      t.timestamps
    end
  end
end
