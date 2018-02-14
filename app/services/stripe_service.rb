class StipeService

  def create_customer(email,token, order)
      customer = Stripe::Customer.create(
        :email => email,
        :source  => token
      )
      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => (order.total_price * 100).to_i,
        :description => 'Rails Stripe customer',
        :currency    => 'usd'
      )
    end
end
