class UsersController < ApplicationController
  def show
  end

  def new
    @user = User.new(session[:user] || {})
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      session[:user] = nil
      flash[:success] = 'ユーザを登録しました。'
      redirect_to root_url
    else
      session[:user] = @user.attributes.slice(*user_params.keys)
      flash[:danger] = 'ユーザの登録に失敗しました。'
      redirect_to signup_url
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
