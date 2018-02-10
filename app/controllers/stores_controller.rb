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

  def edit
    @store = current_user.stores.find_by(params[:id])
  end

  def update
  @store = Store.find_by(params[:id])
  @store.update!(update_params)
  redirect_to "/#{@store.slug}/manage"
  end

 def show
  @store = Store.find_by(slug: params[:store])
 end

private

  def store_params
    params.require(:store).permit(:name, :address, :slug)
  end

  def update_params
    params.permit(:name, :address, :slug)
  end



end
