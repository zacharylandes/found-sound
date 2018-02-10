class Developer < ApplicationRecord
  belongs_to :user, optional: true

  before_save :generate_key

  def generate_key
    self.key = SecureRandom.urlsafe_base64
  end
end
