class Department < ApplicationRecord
  has_many :categories
  has_many :items, through: :categories
  validates :title, presence: true, uniqueness: true

  before_save :set_slug

  def set_slug
    self.slug = title.parameterize
  end
end
