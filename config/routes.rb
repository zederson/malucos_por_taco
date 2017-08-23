Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get '/admin', to: 'admin#index', as: 'admin'

  resources :players
  resources :matches
  resources :teams, only: [:index]
end
