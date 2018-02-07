class StoresController < ApplicationController

  def index
    @stores = current_user.stores
  end

  def new
    @store = Store.new
  end

  def create
    store = Store.new(store_params)
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
    params[:store][:user_id] = current_user.id
    params.require(:store).permit(:name, :address, :user_id, :status)
  end

end
