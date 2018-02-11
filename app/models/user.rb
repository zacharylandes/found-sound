class User < ApplicationRecord
  has_secure_password
  has_many :orders
  has_many :user_stores
  has_many :stores, through: :user_stores
  has_one :developer

  validates :first_name, :last_name,  presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence:true, allow_nil: true

  enum role: ["default", "admin"]

  scope :all_except, ->(user) { where.not(id: user) }


  def full_name
    first_name + " " + last_name
  end

  def date_joined
    created_at.strftime('%b. %d, %Y')
  end

  def self.user_orders
    group(:email).joins(:orders).count
  end

  def self.user_quantity_of_items_ordered
    group(:email).joins(orders: :order_items).sum(:quantity)
  end


  def key
    developer.key
  end

  def is_developer?
    !developer.nil?
  end

  def platform_admin?
    if role == "admin"
      true
    else
      false
    end
  end

  def store_admin?
    if user_stores.pluck(:user_type).include?("store_admin")
      true
    else
      false
    end
  end

  def store_manager?
    if user_stores.pluck(:user_type).include?("store_manager")
      true
    else
      false
    end
  end

  def registered_user?
    if role == "default"
      true
    else
      false
    end
  end

  def role_at_current_store(store)
    user_stores.find_by(store_id: store).user_type
  end

end
