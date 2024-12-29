Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # ログイン関連
  root to: "sessions#index" # ルートパスをログイン画面に設定
  get "login", to: "sessions#index", as: :login
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy", as: :logout

  # 在庫管理関連
  resources :items, only: [:index, :new, :create, :edit, :update, :destroy]          # 在庫一覧の表示
end
