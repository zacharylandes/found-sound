class Item < ApplicationRecord
  belongs_to :category
  has_many :order_items
  has_many :views
  has_many :items, through: :views
  belongs_to :store, optional: true
  has_many :orders, through: :order_items
  validates :title,  presence: true, uniqueness: true
  validates :description, :price, presence: true
  enum condition: ["active", "retired"]
  # default_scope {order(:title)}

  def self.total_sold_by_item
    group(:title).joins(:order_items).sum(:quantity)
  end

  def self.items_by_title_with_status
    group(:title).joins(:orders).group(:status).count
  end

end
