class Users::DashboardController < ApplicationController
  layout "kioskapp"
  before_action :set_kiost, only: [ :kiost ]
  # before_action :set_dashboard, only: [:show]
  before_action :authenticate_user!

    def index
      @kiosks = Kiosk.all
    end

    def kiost
      @kiost = Kiosk.find_by(id: params[:id])
      if @kiost.nil?
        flash[:alert] = "Kiosk not found."
        redirect_to users_dashboard_path
      else
        # @user = current_user
        # if @user.time_in.nil?
        #   @user.check_in
        #   flash[:notice] = "Checked in successfully at #{@user.time_in.strftime("%Y-%m-%d %H:%M:%S")}"
        # else
        #   flash[:alert] = "Already checked in at #{@user.time_in.strftime("%Y-%m-%d %H:%M:%S")}"
        # end
      end
    end

    def check_in
      @user = current_user
      if @user.time_in.nil?
        @user.check_in
        flash[:notice] = "Checked in successfully at #{@user.time_in.strftime("%Y-%m-%d %H:%M:%S")}"
      else
        flash[:alert] = "Already checked in at #{@user.time_in.strftime("%Y-%m-%d %H:%M:%S")}"
      end
    end




    def check_out
      @user = current_user

      if @user.time_in.nil?
        flash[:alert] = "You need to check in first."
      else
        @user.check_out
        flash[:notice] = "Checked out successfully at #{@user.time_out.strftime("%Y-%m-%d %H:%M:%S")}"
      end

      redirect_to users_dashboard_path
    end


    private

    def set_kiost
      @kiost = Kiosk.find_by(id: params[:id])
    end

    def authenticate_user
      unless session[:user_id].present?
        redirect_to new_user_session_path, alert: "You must be logged in to access this page"
      end
    end
end
