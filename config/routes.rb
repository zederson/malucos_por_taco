Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get '/admin', to: 'admin#index', as: 'admin'
  get '/dashboard/general', to: 'home#show', as: 'dashboard_general'

  resources :players
  resources :matches
  resources :teams, only: [:index]
end
