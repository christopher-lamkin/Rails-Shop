class ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "Product created successfully!"
      redirect_to @product
    else
      render 'new'
      flash[:error] = "Product not created."
    end
  end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:success] = "Product updated successfully!"
      redirect_to @product
    else
      render 'edit'
      flash[:error] = "Product not updated."
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:success] = "Product deleted successfully"
    redirect_to products_path
  end

  def admin
    @products = Product.all
  end

  private
  def product_params
    params.require(:product).permit(:product_name, :product_description, :price, :image_url, :quantity)
  end

end
