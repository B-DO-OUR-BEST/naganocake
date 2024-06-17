class Public::HomesController < ApplicationController
  def top
    items = Item.all
    @items = items
  end

  def about
  end
end
