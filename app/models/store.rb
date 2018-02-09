class Store < ApplicationRecord
  has_many :items
  has_many :user_stores
  has_many :users, through: :user_stores

  validates :name, uniqueness: true
  validates_presence_of :status, :name, :address
  before_save :set_slug

  scope :active_stores, -> { where(status: "active")}
  scope :pending_stores, -> { where(status: "pending")}
  scope :suspended_stores, -> { where(status: "suspended")}

  def set_slug
    self.slug = name.parameterize
  end


  def active_items
    items.where(condition: 'active')
  end
end
