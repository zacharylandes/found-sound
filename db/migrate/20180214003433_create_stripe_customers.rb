class CreateStripeCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :stripe_customers do |t|
      t.string :email
      t.string :token

      t.timestamps
    end
  end
end
