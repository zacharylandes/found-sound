class CreateStoreOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :store_orders do |t|
      t.references :order, foreign_key: true
      t.references :store, foreign_key: true
      t.string :status
      t.integer :total_price

      t.timestamps
    end
  end
end
