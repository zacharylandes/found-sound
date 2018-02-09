class Store < ApplicationRecord
  has_many :items
  has_many :user_stores
  has_many :users, through: :user_stores
  validates :name, uniqueness: true
  validates_presence_of :status, :name, :address
  before_save :set_slug

  def set_slug
    self.slug = name.parameterize
  end

  def active_items
    items.where(condition: 'active')
  end

  def user_type(user)
    user_stores.find_by(user_id: user).user_type
  end

end
