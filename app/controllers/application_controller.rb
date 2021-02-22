class ApplicationController < ActionController::Base
  
  include SessionsHelper
  
  private
  
  def require_user_logged_in
    unless logged_in?
      flash[:danger] = "この操作を行うにはログインしてください。"
      redirect_to login_url
    end
  end
end
