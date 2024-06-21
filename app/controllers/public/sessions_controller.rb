# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  def show
    @customer_new = Customer.new
    @customers = Customer.all
    @customer = Customer.find(session_params[:id])
    render "customers/show"
  end
  
  private

  def session_params
    params.require(:session).permit(:id)
  end
  
end
