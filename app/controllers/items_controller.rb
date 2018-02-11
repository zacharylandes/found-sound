class ItemsController < ApplicationController

	def show
		@item = Item.find(params[:id])
	end

	def edit
		@store = Store.find(params[:store_id])
		@item = Item.find(params[:id])
	end

	def update
		@item = Item.find(params[:id])
		store = Store.find(params[:store_id])
		if @item.update(item_params)
			redirect_to store_path(store.slug)
		else
			render :edit
		end
	end

	private

		def item_params
			params.require(:item).permit(:title, :description, :price, :condition)
		end
end
