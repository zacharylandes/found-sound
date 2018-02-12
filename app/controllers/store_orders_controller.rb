class StoreOrdersController < ApplicationController
  before_action :require_current_user



<<<<<<< HEAD
  def show
    @order = StoreOrder.find(params[:id])
    render 'orders/show.html.erb'

  end
=======
>>>>>>> refactor

  def update
    @storeorder = StoreOrder.find(params[:id])
    @storeorder.update(store_order_params)
    @storeorder.save
    redirect_back(fallback_location: root_path)
  end

  def create
    order =  Order.create(status: "ordered", user_id: current_user.id)
     order.add(@cart)
     OrderCreator.new(order, current_user).create_store_order
    @cart.destroy
    flash[:success] = "Order was successfully placed"
    redirect_to orders_path

  end

  private

  def require_current_user
    redirect_to login_path unless current_user
  end

  def store_order_params
     params.require(:store_order).permit(:status) || params.permit(:status, :user_id)
  end

end
