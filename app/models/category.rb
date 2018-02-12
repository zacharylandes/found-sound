class Category < ApplicationRecord
  has_many :items
  belongs_to :department
  validates :title, :slug, presence: true
  extend FriendlyId
  friendly_id :title, use: :slugged
end
