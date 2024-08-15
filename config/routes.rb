Rails.application.routes.draw do
  devise_for :users
  resources :items, only: [:index, :show, :new, :create] do
    member do
      get 'purchase'
    end
  end
  root to: 'items#index'
end
