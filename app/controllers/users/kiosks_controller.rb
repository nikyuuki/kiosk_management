class Users::KiosksController < ApplicationController
  layout "userapp"
  before_action :set_kiosk, only: [ :show ]

  # Show details of the currently selected kiosk
  def show
    @kiosk = Kiosk.find_by(id: params[:id])
        Rails.logger.info " the user for this id is #{@kiosk.inspect}"
    # @kiosk 
    Rails.logger.info " the kiost is #{@kiosk.inspect}"
    if @kiosk.nil?
      redirect_to users_dashboard_path, alert: "Please select a kiosk to proceed."
    end
  end

  private

  # Fetch the current kiosk based on session or user data
  def set_kiosk
    # Example: Fetch the kiosk ID from the session
    # Kiosk.find_by(id: session[:current_kiosk_id])
    @kiost = Kiosk.find_by(id: params[:kiosk_id])
    # Alternative: Fetch from user association (if applicable)
    # current_user.kiosk
  end
end
