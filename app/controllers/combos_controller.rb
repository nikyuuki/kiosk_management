class CombosController < ApplicationController
  layout "adminapp"  
  before_action :set_combo, only: %i[show edit update destroy]

  # GET /combos or /combos.json
  def index
    @combos = if params[:query].present?
      Combo.joins(:products).where(
        "combos.name ILIKE :query OR products.name ILIKE :query",
        query: "%#{params[:query]}%"
      ).distinct
    else
      Combo.all
    end

  end

  # GET /combos/1 or /combos/1.json
  def show
  end

  # GET /combos/new
  def new
    @combo = Combo.new
    @products = Product.all
  end

  # GET /combos/1/edit
  def edit
    @products = Product.all
  end

  # POST /combos or /combos.json
  def create
    @combo = Combo.new(combo_params)

    respond_to do |format|
      if @combo.save
        format.html { redirect_to @combo, notice: "Combo was successfully created." }
        format.json { render :show, status: :created, location: @combo }
      else
        @products = Product.all
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @combo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /combos/1 or /combos/1.json
  def update
    respond_to do |format|
      if @combo.update(combo_params)
        format.html { redirect_to @combo, notice: "Combo was successfully updated." }
        format.json { render :show, status: :ok, location: @combo }
      else
        @products = Product.all
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @combo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /combos/1 or /combos/1.json
  def destroy
    @combo.destroy
    respond_to do |format|
      format.html { redirect_to combos_url, notice: "Combo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_combo
    @combo = Combo.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def combo_params
    params.require(:combo).permit(:name, :price, product_ids: [])
  end
end
