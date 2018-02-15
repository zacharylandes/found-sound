class AdminChatPresenter
  attr_reader :chatroom

  def initialize(chatroom_id)
    @chatroom = Chatroom.find(chatroom_id)
  end

  def user
    chatroom.user
  end

  def user_order_count
    user.orders.count
  end

  def recent_orders
    user.orders.order("updated_at DESC").limit(5)
  end
end
