class UtilitiesController < ApplicationController
  layout "adminapp"  # Use the "adminapp" layout for all actions in this controller
  before_action :set_utility, only: %i[ show edit update destroy ]

  # GET /utilities or /utilities.json
  def index
    @utilities = if params[:search].present?
      # Using an inner join to search both the utility name and category utility name
      Utility.joins(:category_utility)
             .where("utilities.name ILIKE :query OR category_utilities.name ILIKE :query", query: "%#{params[:search]}%")
    else
      Utility.all
    end
  end
  
  # GET /utilities/1 or /utilities/1.json
  def show
  end

  # GET /utilities/new
  def new
    @utility = Utility.new
  end

  # GET /utilities/1/edit
  def edit
  end

  # POST /utilities or /utilities.json
  def create
    @utility = Utility.new(utility_params)

    respond_to do |format|
      if @utility.save
        format.html { redirect_to @utility, notice: "Utility was successfully created." }
        format.json { render :show, status: :created, location: @utility }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @utility.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /utilities/1 or /utilities/1.json
  def update
    respond_to do |format|
      if @utility.update(utility_params)
        format.html { redirect_to @utility, notice: "Utility was successfully updated." }
        format.json { render :show, status: :ok, location: @utility }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @utility.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /utilities/1 or /utilities/1.json
  def destroy
    @utility.destroy!

    respond_to do |format|
      format.html { redirect_to utilities_path, status: :see_other, notice: "Utility was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_utility
      @utility = Utility.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def utility_params
      params.require(:utility).permit(:name, :quantityperset, :category_utility_id)
    end
  end