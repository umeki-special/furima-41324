Rails.application.routes.draw do
  devise_for :users

  resources :items do
    resources :orders, only: [:create, :index]
  end

  # トップページのルート設定
  root to: 'items#index'
end
