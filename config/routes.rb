Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "login#index"

  get "login", to: "login#index", as: "login"
  get "list", to: "list#index", as: "list"
  get "register", to: "register#index", as: "register"

  # ユーザーIDとパスワードがポスト送信されたときに合っているか判定するルート
  post "login", to: "login#authentication"

  get "logout", to: "login#destroy", as: "logout"

end
