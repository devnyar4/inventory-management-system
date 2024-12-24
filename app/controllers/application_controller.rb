class ApplicationController < ActionController::Base
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
    if @current_user
      @current_user.first_name = session[:first_name]
      @current_user.last_name = session[:last_name]
    end
    @current_user
  end

  def require_login
    unless current_user
      redirect_to login_path, notice: 'ログインしてください'
    end
  end
end
