class ProductsController < ApplicationController
  layout "adminapp"
  before_action :set_product, only: %i[edit update destroy]

  # GET /products or /products.json
  def index
    @products = if params[:search].present?
      Product.joins(:category_product)
      .where("products.code ILIKE :query OR products.name ILIKE :query OR category_products.name ILIKE :query", query: "%#{params[:search]}%")
    else
      Product.all
    end
  end


  def show
    @product = Product.find(params[:id])
    respond_to do |format|
      format.html # regular page load
      format.js   # for modal
    end
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
    respond_to do |format|
      format.html # regular page load
      format.js   # for modal
    end
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    if @product.update(product_params)
      redirect_to @product, notice: "Product was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_path, notice: "Product was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :category_product_id, :priceperpack, :code)
    end
end
