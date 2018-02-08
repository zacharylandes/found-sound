class RemoveUserFromStores < ActiveRecord::Migration[5.1]
  def change
    remove_reference(:stores, :user, index: true)
  end
end
