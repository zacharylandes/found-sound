class AddLastFourToStripeCustomer < ActiveRecord::Migration[5.1]
  def change
    add_column :stripe_customers, :last_four, :string
  end
end
