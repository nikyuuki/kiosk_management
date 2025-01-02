class Users::UtilityStatusesController < ApplicationController
  layout "userapp"  # Use the "adminapp" layout for all actions in this controller
  before_action :set_utility, only: [ :update ]

  def index
    # Fetch all utilities (or your logic for fetching utilities)
    @utilities = Utility.all

    # Fetch all utility statuses for the current date and kiosk_id (or your filter logic)
    @utility_statuses = UtilityStatus.where(date: Date.today, kiosk_id: 1)  # Example date and kiosk_id
  end
  def update
    utility_status = UtilityStatus.find(params[:id])

    # Update the utility_status attributes
    if utility_status.update(utility_status_params)
      redirect_to utility_statuses_path, notice: "Utility status updated successfully."
    else
      render :index, alert: "Failed to update utility status."
    end
  end

  private

  def utility_status_params
    params.require(:utility_status).permit(:description, :status_opening, :status_closing)
  end
  def update_status
    utility_status = UtilityStatus.find_or_initialize_by(utility_id: params[:utility_id], date: params[:date], kiosk_id: params[:kiosk_id])

    if params[:status] == "status_opening"
      utility_status.status_opening = params[:value]
    elsif params[:status] == "status_closing"
      utility_status.status_closing = params[:value]
    end

    if utility_status.save
      render json: { success: true }
    else
      render json: { success: false, errors: utility_status.errors.full_messages }
    end
  end

  def update_description
    utility_status = UtilityStatus.find_or_initialize_by(utility_id: params[:utility_id], date: params[:date], kiosk_id: params[:kiosk_id])
    utility_status.description = params[:description]

    if utility_status.save
      render json: { success: true }
    else
      render json: { success: false, errors: utility_status.errors.full_messages }
    end
  end
  private

  def set_utility
    @utility = Utility.find(params[:utility_id])
  end
  def set_kiost
    @Kiost = Kiost.find_by(id: params[:kiost_id])
  end
end
