Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :players
  resources :matches
  resources :teams, only: [:index]
end
