class OrdersController < ApplicationController
  before_action :require_current_user

  def index
    @user = current_user
    @user.orders.preload(:items)
  end

  def new
    @total = params[:total]
    @order = Order.new
  end

  def show
    if current_admin?
      @order = Order.find(params[:id])
    else
      @order = current_user.orders.find(params[:id])
    end
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    @order.save
    redirect_back(fallback_location: root_path)
  end

  def create
      order =  Order.create(status: "ordered", user_id: current_user.id)
      order.add(@cart)
      StripeService.new.stripe_customer(params[:stripeEmail], params[:stripeToken], order)
      OrderCreator.new(order).create_store_order
      session[:cart].clear
      flash[:success] = "Order was successfully placed"
      redirect_to order_path(order)
  end

  private

  def require_current_user
    redirect_to login_path unless current_user
  end

  def order_params
     params.require(:order).permit(:status) || params.permit(:status, :user_id)
  end

end
