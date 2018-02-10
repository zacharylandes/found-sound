class Stores::EmployeesController < ApplicationController

  def update
    store = Store.find_by(params[:id])
    user_store = User.find(params[:user]).user_stores.find_by(store_id: store)
    user_store.update(user_type: params[:change])
    redirect_to "/#{store.slug}/manage"
  end

end
