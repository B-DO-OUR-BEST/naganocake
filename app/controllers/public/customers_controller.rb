class Public::CustomersController < ApplicationController

  before_action :authenticate_customer!


  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customer_path, notice: '更新が完了しました。'
    else
      render :edit
    end
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer = Customer.find(current_customer.id)
    @customer.update(is_active: false)
    reset_session
    flash[:notice] = "Thank you for the good rating. We hope to see you again."
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :password, :password_confirmation)
  end

end

