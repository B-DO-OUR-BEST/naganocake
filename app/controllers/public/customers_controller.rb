class Public::CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :unsubscribe, :withdraw]

  def show
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to @customer, notice: '更新が完了しました。'
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    @customer.update(is_active: false)
    reset_session
    flash[:notice] = "ご利用ありがとうございました。またのご利用をお待ちしております。"
    redirect_to root_path
  end

  private

  def set_customer
    @customer = current_customer
  end

  def customer_params
    params.require(:customer).permit(:name, :email, :password, :password_confirmation)
  end
end
