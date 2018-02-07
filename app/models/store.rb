class Store < ApplicationRecord
  has_many :items
  validates_presence_of :name, :address, :status
  before_save :set_slug

  def set_slug
    self.slug = name.parameterize
  end

  def active_items
    items.where(condition: 'active')
  end
end
