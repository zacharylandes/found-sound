class RemoveStoreIdFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_reference :users, :store, index: true, foreign_key: true
  end
end
