class MainController < ApplicationController
  def index
    @popular_items = OrderItem.top_three_items
    @history = RecentItems.new(session[:history]).get_items
  end
end
