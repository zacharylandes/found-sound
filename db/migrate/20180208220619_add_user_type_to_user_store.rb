class AddUserTypeToUserStore < ActiveRecord::Migration[5.1]
  def change
    add_column :user_stores, :user_type, :integer
  end
end
