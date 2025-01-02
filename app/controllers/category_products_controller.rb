class CategoryProductsController < ApplicationController
  layout "adminapp"  # Use the "adminapp" layout for all actions in this controller
  before_action :set_category_product, only: %i[ show edit update destroy ]
  # GET /category_products

  def index
    @category_products = if params[:search].present?
      CategoryProduct.where("name ILIKE :query", query: "%#{params[:search]}%")
    else
      CategoryProduct.all
    end
  end

  # GET /category_products/:id
  def show
  end

  def new
    @category_products = CategoryProduct.new
  end
  # GET /category_products/:id/edit
  def edit
  end

  def create
    @category_product = CategoryProduct.new(category_product_params)

    respond_to do |format|
      if @category_product.save
        format.html { redirect_to @category_product, notice: "category product was successfully created." }
        format.json { render :show, status: :created, location: @category_product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kiosks/1 or /kiosks/1.json
  def update
    respond_to do |format|
      if @category_product.update(category_product_params)
        format.html { redirect_to @kiosk, notice: "Kiosk was successfully updated." }
        format.json { render :show, status: :ok, location: @category_product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category_products/:id
  #
  def destroy
    @category_product.destroy!

    respond_to do |format|
      format.html { redirect_to category_products_path, status: :see_other, notice: "category products was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category_product
      @category_product = CategoryProduct.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_product_params
      params.require(:category_product).permit(:name)
    end
end
