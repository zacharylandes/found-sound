class ChangeStoreStatusDefault < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:stores, :status, "pending")
  end
end
