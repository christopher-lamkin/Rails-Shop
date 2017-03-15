class CartsProductsController < ApplicationController

  def new
    @carts_product = CartsProduct.new
  end

  def create
    @user = current_user
    @cart = Cart.find_by(user_id: @user.id)
    @product = Product.find(params[:carts_product][:product_id])
    @carts_product = CartsProduct.new(cart_id: @cart.id, product_id: @product.id, quantity: params[:carts_product][:quantity])
    @carts_product = CartsProduct.find_or_initialize_by(title: params[:carts_product])
    if @carts_product.quantity <= @product.quantity && @carts_product.save
      flash[:success] = "Item added to cart!"
      redirect_to cart_path(@cart.id)
    else
      flash[:error] = "Failed to add item to cart."
      redirect_to @product
    end
  end

  def destroy
    @carts_product = CartsProduct.find(params[:id])
    @carts_product.destroy
    flash[:success] = "Product successfully deleted from cart"
    redirect to cart_path(current_user.cart.id)
  end
end
