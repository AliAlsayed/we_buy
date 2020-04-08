class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :require_correct_seller]
  before_action :authenticate_user!
  before_action :require_correct_seller, only: [:show, :edit, :delete]

  # GET /products
  # GET /products.json
  def index
    @user = User.find(params[:user_id])
    redirect_to root_url unless @user.is_seller && @user == current_user
    @products = @user.products 
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
  end

  # GET /products/new
  def new
    @user = current_user
    redirect_to root_url unless @user.is_seller
    @product = @user.products.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @product.seller = current_user

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    # respond_to do |format|
    #   format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
    redirect_to root_path
  end

  private

    def require_correct_seller
     unless @product.seller == current_user && current_user.is_seller
      redirect_to root_url
     end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :description, :image_url, :price)
    end
end
