class ItemsController < ApplicationController

	def show
		@item = Item.find(params[:id])
	end

	def edit
		if at_this_store?
			@store = Store.find_by(slug: params[:store])
			@item = Item.find(params[:id])
		else
			not_found
		end
	end

	def update
		@item = Item.find(params[:id])
		store = Store.find(params[:store])
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
