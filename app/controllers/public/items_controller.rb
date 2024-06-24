class Public::ItemsController < ApplicationController
   before_action :authenticate_customer!, except: [:index]

  def index
    @items = Item.all
    @item_count = @items.count
    @items = @items.page(params[:page]).per(8)
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem
  end

  private
  def item_params
    params.require(:items).permit(:genre_id,:name,:description,:image_id,:price)
  end
end
