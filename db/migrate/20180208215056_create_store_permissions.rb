class CreateStorePermissions < ActiveRecord::Migration[5.1]
  def change
    create_table :store_permissions do |t|
      t.references :store, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :user_type

      t.timestamps
    end
  end
end
