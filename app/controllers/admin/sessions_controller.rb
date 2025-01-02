# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  layout "authentication"
  def create
    super do |resource|
      # Store the Admin ID in the session
      session[:admin_id] = resource.id  # Store the admin ID in the session
    end
  end

  def after_sign_in_path_for(resource)
    admin_dashboard_path # Redirect to admin dashboard after sign-in
  end


  
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
