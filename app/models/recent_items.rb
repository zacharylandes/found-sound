class RecentItems

  def initialize(history)
    @history = history
  end

  def get_item_ids
    @history.map do |url|
      url.split("/").last.to_i
    end
  end

  def get_items
    get_item_ids.map do |id|
      Item.find(id)
    end
  end

end
