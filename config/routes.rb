Rails.application.routes.draw do
  root 'home#index'

  # Define other routes for resources
  resources :utilities
  resources :products
  resources :kiosks 
  resources :combos
  resources :attendant_shifts
  resources :utility_statuses, only: [:index] do
    collection do
      post :update_status
    end
  end
  


  namespace :admin do
    get 'dashboard', to: 'dashboard#index', as: 'dashboard'
  end
  namespace :users do
    get 'dashboard', to: 'dashboard#index', as: 'dashboard' do
      post 'time_in', on: :member
      post 'time_out', on: :member
    end

  end


  devise_for :admin, controllers: { 
    sessions: 'admin/sessions' }

  devise_for :users, controllers: { 
    sessions: 'users/sessions' }

end

