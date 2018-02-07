class RemoveStoreReference < ActiveRecord::Migration[5.1]
  def change
    remove_reference :items, :store, index: true, foreign_key: true

  end
end
