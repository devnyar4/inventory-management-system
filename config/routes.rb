Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # ログイン関連
  root to: "sessions#index" # ルートパスをログイン画面に設定
  get "login", to: "sessions#index", as: :login
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy", as: :logout
  # resource :session, only: [:index, :create, :destroy]

  # 在庫管理関連
  resources :items, except: [:show]        # 在庫一覧の表示
end
