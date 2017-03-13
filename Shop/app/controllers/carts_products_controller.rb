class CartsProductsController < ApplicationController
  def create
    @user = current_user
    @cart_product = CartsProduct.new(cart_id: @user.cart_id, product_id: params[:product_id], quantity: 1)
    if @cart_product.save
      flash[:success] = "Item added to cart!"
    else
      flash[:error] = "Failed to add item to cart."
    end
  end
end
