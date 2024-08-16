Rails.application.routes.draw do
  devise_for :users

  resources :items do
    member do
      get 'purchase'  # または post 'purchase' など購入機能に応じて
    end
  end

  resources :orders, only: [:create]

  # トップページのルート設定
  root to: 'items#index'
end
