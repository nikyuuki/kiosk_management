class Users::DashboardController < ApplicationController
  layout "kioskapp"
  before_action :authenticate_user!
  
    def index
      @kiosks = Kiosk.all 
    end
   

    private

    def authenticate_user
      unless session[:user_id].present?
        redirect_to new_user_session_path, alert: "You must be logged in to access this page"
      end
    end
  end