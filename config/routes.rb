Rails.application.routes.draw do
  devise_for :users
  resources :items, only: [:index, :show, :new, :create, :destroy, :edit] do
  end
  root to: 'items#index'
end
