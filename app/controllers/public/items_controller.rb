class Public::ItemsController < ApplicationController
  def index
    @items = item.all
  end

  def show
  end
end
