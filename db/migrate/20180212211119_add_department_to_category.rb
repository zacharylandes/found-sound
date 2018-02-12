class AddDepartmentToCategory < ActiveRecord::Migration[5.1]
  def change
    add_reference :categories, :department, foreign_key: true
  end
end
