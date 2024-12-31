class Admin::DashboardController < ApplicationController
    layout "adminapp"
    before_action :authenticate_admin!
  
    def index
  
    end
   
    private

    def authenticate_admin
      unless session[:admin_id].present?
        redirect_to new_admin_session_path, alert: "You must be logged in as an admin to access this page"
      end
    end
  end