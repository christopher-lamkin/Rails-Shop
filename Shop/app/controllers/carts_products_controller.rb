class CartsProductsController < ApplicationController

  def new
    @carts_product = CartsProduct.new
  end

  def create
    @user = current_user
    p "***********************************"
    p current_user.username
    p "***********************************"
    @cart = Cart.find_by(user_id: current_user.id)
    @carts_product = CartsProduct.new(cart_id: @cart.id, product_id: params[:product_id], quantity: params[:quantity])
    if @carts_product.save
      flash[:success] = "Item added to cart!"
      redirect_to @cart
    else
      flash[:error] = "Failed to add item to cart."
    end
  end
end
