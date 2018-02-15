class Order < ApplicationRecord
  belongs_to :user
  validates :status, presence: true
  has_many :order_items
  has_many :items, through: :order_items

  enum status: ["ordered", "paid", "cancelled", "completed"]

  def calculate_total(rate = 0)
    self.total_price = order_items.map do |oi|
      oi.item.price * oi.quantity
    end.sum
    self.total_price += rate
    self.save!
  end

  def add(cart, rate = 0)
     cart.cart_items.each do |item|
      items << item
      order_item = OrderItem.find_by(order: self, item_id: item.id)
      order_item.update(quantity: cart.quantity_of(item.id))
    end
    calculate_total(rate)
  end

  def date
    created_at.strftime('%b. %d, %Y')
  end

  def self.count_by_status
    group(:status).count
  end

  def self.filter_by_status(status)
    where(status: status)
  end

  def self.count_of_completed_orders
    where(status: :completed).count
  end

  def self.shop_total_gross
		where(status: :completed).joins(:items).sum(:price)
  end
end
