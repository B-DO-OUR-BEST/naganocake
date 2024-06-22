class Public::RegistrationsController < Devise::RegistrationsController
  #before_action :configure_sign_up_params, only: [:create]
  #before_action :authenticate_user!
  
  #include Devise::Controllers::Helpers
  # before_action :configure_account_update_params, only: [:update]
  
  #def new
    #@customer = Customer.new
  #end
  
  #def create
    #@customer = Customer.new(customer_params)
    #if @customer.save
      #redirect_to my_page_customers_path
    #else
      #render :new
    #end
  #end
  
  #def customer_params
   # params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,
    #:email, :post_code, :address, :telephone_number, :password, :password_confirmation)
  #end
end
