class AddStripeIdToStripeCustomer < ActiveRecord::Migration[5.1]
  def change
    add_column :stripe_customers, :stripe_id, :string
  end
end
