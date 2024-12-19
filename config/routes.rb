Rails.application.routes.draw do
 
  root 'home#index'

  # Define other routes for resources
  resources :utilities
  resources :products
  resources :kiosks

  # Admin dashboard route
  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
  end
  devise_for :users, controllers: { sessions: 'users/sessions' }


end
