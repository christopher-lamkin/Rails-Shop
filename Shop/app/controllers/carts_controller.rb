class CartsController < ApplicationController

  def show
    @cart = current_user.cart
    @carts_products = CartsProduct.all
  end

end
