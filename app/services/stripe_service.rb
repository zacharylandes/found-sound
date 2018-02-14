class StripeService

  def stripe_customer(email,token, order)

    if StripeCustomer.find_by(email: email)
      customer = StripeCustomer.find_by(email: email)
      charge_customer(order, customer)
    else

    customer = Stripe::Customer.create(
      :email => email,
      :source  => token
    )
    customer = StripeCustomer.create!(email: email, token:token, stripe_id: customer.id)
    end
  end

    def charge_customer(order,customer)
      charge = Stripe::Charge.create(
        :customer    => customer.stripe_id,
        :amount      => (order.total_price * 100).to_i,
        :description => 'Rails Stripe customer',
        :currency    => 'usd'
      )
    end
end
