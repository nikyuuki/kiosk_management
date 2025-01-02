Rails.application.routes.draw do
  # Root path
  root "home#index"

  # General routes
  resources :utilities
  resources :products
  resources :category_products
  resources :kiosks do
    post "time_in", on: :member
    post "time_out", on: :member
  end
  resources :combos
  resources :attendant_shifts
  resources :utility_statuses, only: [ :index ] do
    collection do
      post :update_status
    end
  end

  # Admin namespace
  namespace :admin do
    get "dashboard", to: "dashboard#index", as: "dashboard"
  end

  # User namespace
  namespace :users do
    get "dashboard", to: "dashboard#index", as: "dashboard"
    get "kiosk/:id", to: "kiosks#show", as: "kiost"
     post :check_in, to: "attendant_shifts#check_in", as: "check_in"
    # Check-in and check-out routes
    post :check_out, to: "dashboard#check_out", as: "check_out"
  end

  # Devise routes
  devise_for :admin, controllers: { sessions: "admin/sessions" }
  devise_for :users, controllers: { sessions: "users/sessions" }
end
