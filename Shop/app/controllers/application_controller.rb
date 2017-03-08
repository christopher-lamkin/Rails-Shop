class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_admin
    unless current_user.admin
      flash[:danger] = "You are not an administrator."
      redirect_to '/'
    end
  end

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
