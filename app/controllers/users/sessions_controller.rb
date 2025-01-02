# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  layout "authentication"
  def create
    super do |resource|
      # Store the User ID in the session
      session[:user_id] = resource.id  # Store the user ID in the session
    end
  end

  # def after_sign_in_path_for(resource)
  #   users_dashboards_path # Redirect to user dashboard after sign-in
  # end

  def destroy
    super do
      # Optional: Clear user session explicitly if needed
      session.delete(:user_id)  # Remove user session only
      redirect_to root_path, notice: "You have logged out as User." and return
    end
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
