# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  layout "authentication"
    def new
      # Render login form for both Admin and User
    end
    def new_admin
      # Render login form for both Admin and User
    end
  
    def create_as_user
      user = User.find_by(email: params[:email])
  
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to user_dashboard_path
      else
        flash[:alert] = 'Invalid credentials'
        render :new
      end
    end
  
    def create_as_admin
      admin = Admin.find_by(email: params[:email])
  
      if admin && admin.authenticate(params[:password])
        session[:admin_id] = admin.id
        redirect_to admin_dashboard_path
      else
        flash[:alert] = 'Invalid credentials'
        render :new_admin
      end
    end
  
    def destroy
      session.delete(:user_id)
      session.delete(:admin_id)
      redirect_to root_path
    end
  end
  