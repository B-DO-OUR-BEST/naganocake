class Public::CustomersController < ApplicationController
  
  def show
    @customer = current_customer
  end

  def edit
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
  end
  
  # private
  
  # def customer_params
  #   params.require(:book).permit(:title, :body)
  # end
  
end
