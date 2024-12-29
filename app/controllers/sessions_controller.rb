class SessionsController < ApplicationController
  def index
    # ログイン画面を表示
    render "login"
  end

  def create
    # login_id に基づいてユーザーを検索
    user = User.find_by(login_id: params[:login_id])
    
    if user && user.password == params[:password]
      # ログイン成功時の処理
      session[:user_id] = user.id
      session[:last_name] = user.last_name
      session[:first_name] = user.first_name
      redirect_to items_path
    else
      # ログイン失敗時の処理
      flash.now[:alert] = 'ログインIDまたはパスワードが正しくありません。'
      render "login"
    end
  end

  def destroy
    # ログアウト処理
    session[:user_id] = nil
    session[:last_name] = nil
    session[:first_name] = nil
    redirect_to login_path, notice: 'ログアウトしました。'
  end
end
