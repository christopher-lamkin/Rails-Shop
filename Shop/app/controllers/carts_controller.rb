class CartsController < ApplicationController

  def show
    @cart = current_user.cart
    @products = @cart.products
  end
  
end
