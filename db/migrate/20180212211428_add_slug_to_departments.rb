class AddSlugToDepartments < ActiveRecord::Migration[5.1]
  def change
    add_column :departments, :slug, :string
  end
end
