class ItemsController < ApplicationController

	def show
		@item = Item.find(params[:id])
	end

	def new
		if at_this_store?
			@store = Store.find_by(slug: params[:store])
			@item = @store.items.new
		else
			not_found
		end
	end

	def create
		@category = Category.find_or_create_by(title: params[:item][:category])
		@store = Store.find(params[:store])
		@item = @store.items.new(item_params.merge(category: @category))
		if @item.save
			redirect_to store_path(@store.slug)
		else
			render :new
		end
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
			auth = {
				cloud_name: ENV['cloud_name'],
				api_key:    ENV['cloudinary_api_key'],
				api_secret: ENV['cloudinary_secret']
			}
			if params[:item][:image].nil?
				params[:item][:image] = 'http://res.cloudinary.com/dhzyzerqn/image/upload/v1518130218/book_cover.png'
			else
				response = Cloudinary::Uploader.upload(params[:item][:image].tempfile.path, auth)
				params[:item][:image] = response['url']
			end
			params.require(:item).permit(:title, :description, :price, :condition, :image)
			# params.require(:item).permit(:title, :description, :price, :image, :category_id)

		end
end
