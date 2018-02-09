class DropStorePermissions < ActiveRecord::Migration[5.1]
  def change
    drop_table :store_permissions
  end
end
