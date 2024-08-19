Rails.application.routes.draw do
  devise_for :users

  resources :items do
    resources :orders, only: [:create, :index]
    post 'order', on: :member
  end

  # トップページのルート設定
  root to: 'items#index'
end
