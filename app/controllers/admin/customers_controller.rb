class Admin::CustomersController < ApplicationController
  def index
    customers = Customer.all
    @customers = customers.page(params[:page]).per(10)
  end

  def show
    @customer = Customers.find(params[:id])
  end

  def edit
  end

  def update
  end
end
