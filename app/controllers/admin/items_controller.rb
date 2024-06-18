class Admin::ItemsController < ApplicationController
  def index
    items = Item.all
    @items = items.page(params[:page]).per(10)
  end

# <%= form_with model: @item do |f| %>で使用します。
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end

  private
  # createで使うストロングパラメータです。
  def item_params
    params.require(:item).permit(:image, :genre_id, :name, :introduction, :price, :is_active)
  end

end
