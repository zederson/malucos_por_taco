Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :players
  resources :matches
  resources :teams, only: [:index]
end
