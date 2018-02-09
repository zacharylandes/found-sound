class Admin::ItemsController < ApplicationController
  before_action :require_admin
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @categories = Category.all
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path
    else
      render :new
    end
  end

  def update
    @categories = Category.all
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to admin_items_path
    else
      render :edit
    end
  end

  def edit
    @item = Item.find(params[:id])
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
    params.require(:item).permit(:title, :description, :price, :image, :category_id)
  end

  def require_admin
    render file: "/public/404" unless current_admin?
  end
end
