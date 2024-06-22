class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  
  def new
    #@customer = Customer.new
  end
  
  #def create
    #user = Customer.find_by(email: params[:session][:email].downcase)
    #if user && user.authenticate(params[:session][:password])
      #log_in user
      #redirect_to root_url
    #else
      #render 'new'
    #end
  #end
  
  #def session_params
    #params.require(:session).permit(:email)
  #end
  
  def create
    user = Customer.find_by(email: params[:session][:email].downcase)
    # bcrypt の authenticateメソッドでパスワードの照合を行なう
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to user
    else
      flash.now[:error] = "ログインに失敗しました"
      render "new", status: :unprocessable_entity
    end
  end

  def destroy
    log_out
    redirect_to root_path, status: :see_other
  end
  
end
