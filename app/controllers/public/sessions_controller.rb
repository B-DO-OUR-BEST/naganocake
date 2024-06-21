class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  
  def new
    @customer = Customer.new
  end
  
  def create
    user = Customer.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  def session_params
    params.require(:session).permit(:email)
  end
  
end
