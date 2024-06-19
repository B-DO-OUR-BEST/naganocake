class Admin::CustomersController < ApplicationController
  def index
    customers = Customer.all
    @customers = customers.page(params[:page]).per(10)
  end

  def show
  end

  def edit
  end

  def update
  end
end
