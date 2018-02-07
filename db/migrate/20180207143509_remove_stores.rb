class RemoveStores < ActiveRecord::Migration[5.1]
  def change
    drop_table :stores
  end
end
