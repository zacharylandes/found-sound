class CreateDevelopers < ActiveRecord::Migration[5.1]
  def change
    create_table :developers do |t|
      t.string :key
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
