class LoginController < ApplicationController
  def index
    @user = User.new
  end

  def create
    @user = User.find_by(email: user_params[:email])

    if @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to [:products]

    else 
      redirect_to action: "index"
    end
  end

  def user_params
    params.require(:user).permit(
      :email,
      :password,
    )
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
