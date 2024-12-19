class UsersController < ApplicationController
    layout "authentication", only: [:login, :signup] # Use "authentication" layout for these actions
  
    def login
      # Login logic here
    end
  
    def signup
      # Signup logic here
    end
  end
  