Rails.application.routes.draw do
  root 'home#index'

  # Define other routes for resources
  resources :utilities
  resources :products
  resources :kiosks
  resources :combos
  resources :utility_statuses, only: [:index] do
    collection do
      post :update_status
    end
  end
  

  # Admin dashboard route
  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
  end

  # Devise routes for users
  devise_for :users, controllers: { 
    sessions: 'users/sessions', 
    registrations: 'users/registrations' 
  }
end

