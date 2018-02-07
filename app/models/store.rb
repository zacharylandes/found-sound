class Store < ApplicationRecord
  has_many :items
  belongs_to :user, :optional => true
  validates :name, uniqueness: true
  validates_presence_of :status, :name, :address
  before_save :set_slug

  def set_slug
    self.slug = name.parameterize
  end

  def active_items
    items.where(condition: 'active')
  end
end
