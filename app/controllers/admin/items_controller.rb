class Admin::ItemsController < ApplicationController
  def index
    @items = items.all.page(params[:page])
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end
end
