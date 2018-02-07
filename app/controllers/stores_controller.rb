class StoresController < ApplicationController
  def show
    @store = Store.find_by(slug: params[:store])
  end
end
