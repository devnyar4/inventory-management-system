class LoginController < ApplicationController
  def index
    render("login/login")
  end

  def authentication
    # login_id に基づいてユーザーを検索
    user = User.find_by(login_id: params[:login_id])
    
    if user && user.password == params[:password]
      # ログイン成功
      session[:user_id] = user.id
      redirect_to list_path, notice: 'ログインしました'
    else
      # ログイン失敗
      flash.now[:alert] = 'ログインIDまたはパスワードが正しくありません'
      render :login
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'ログアウトしました'
  end
end
