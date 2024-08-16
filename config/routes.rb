Rails.application.routes.draw do
  devise_for :users
  resources :items, only: [:index, :show, :new, :create, :destroy, :edit, :update] do
    member do
      get 'purchase'  # or post 'purchase' depending on how you handle the purchase
    end
  end
  root to: 'items#index'
end
