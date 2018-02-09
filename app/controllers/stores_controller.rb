class StoresController < ApplicationController

  def index
    @stores = current_user.stores
  end

  def new
    @store = Store.new
  end

  def create
    store = Store.new(store_params)
    store.users << current_user
    if store.save
      redirect_to dashboard_index_path
    else
      flash[:notice] = "Invalid Credentials"
      redirect_to new_store_path
    end
  end

  def show
    @store = Store.find_by(slug: params[:store])
  end

private

  def store_params
    params.require(:store).permit(:name, :address, :status)
  end

end
