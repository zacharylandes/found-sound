class View < ApplicationRecord

  belongs_to :user
  belongs_to :item

  after_save :clear_history

  def clear_history
    View.where('created_at < ?', 2.months.ago).destroy_all
  end

end
