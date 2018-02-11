class AddColumnToStore < ActiveRecord::Migration[5.1]
  def change
    add_column :stores, :twitter_token, :string
    add_column :stores, :twitter_secret, :string
  end
end
