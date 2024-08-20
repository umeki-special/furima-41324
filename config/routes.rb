Rails.application.routes.draw do
  devise_for :users

  root to: 'items#index'

  # items リソース内の orders リソースとカスタムアクション
  resources :items do
    resources :orders
  end
end
