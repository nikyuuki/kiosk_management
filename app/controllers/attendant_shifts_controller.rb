class AttendantShiftsController < ApplicationController
    layout "adminapp"
    # before_action :set_attendant_shift, only: [:show]
    before_action :set_user, only: [ :show ]



    def index
        @user = User.all
    end

    # GET /attendant_shifts/:id
    def show
        @user = User.find_by(id: params[:id])
        Rails.logger.info " the user for this id is #{@user.inspect}"
    end

    def check_in
      @kiosk = Kiosk.find(params[:id])
      Rails.logger.info " the kiost id is #{@kiost.inspect}"
      # if Attendance.check_in(@user)
      #   render json: { message: 'Checked in successfully!' }, status: :ok
      # else
      #   render json: { message: 'You are already checked in.' }, status: :unprocessable_entity
      # end
    end


    private

    # Set the @attendant_shift for show, edit, update, and destroy actions
    def set_attendant_shift
      @attendant_shift = AttendantShift.find(params[:id])
    end

    def set_user
        @user= User.find_by(id: params[:user_id])
    end

    # Strong parameters for creating and updating an attendant shift
    def attendant_shift_params
      params.require(:attendant_shift).permit(:user_id)
    end
end
