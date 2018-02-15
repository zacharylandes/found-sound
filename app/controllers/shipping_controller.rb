class ShippingController < ApplicationController

  def new
  end

  def show
    easypost = EasypostService.new(shipping_params, current_user)
    @rates = easypost.rates
  end

  private

  def shipping_params
    params.require(:shipping).permit(:street, :city, :state, :zip, :country, :phone)
  end

end
