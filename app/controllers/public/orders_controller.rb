class Public::OrdersController < ApplicationController
  # before_action :authenticate_customer!
  
  def new
  end

  def confirm
  end

  def thanks
  end

  def create
  end

# .latestmethodはApplicationモデルに記載。created_at の値を降順で並び替える機能。
  def index
    @orders = current_customer.orders.latest
  end

  def show
    @order = current_customer.orders.fibd(params[:id])
  end
end
