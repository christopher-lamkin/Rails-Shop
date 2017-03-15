class OrdersController < ApplicationController

  def index
    @orders = CartsProduct.all
  end

  def create
    @user = current_user
    @cart = Cart.find_by(user_id: @user.id)
    @carts_products = @cart.carts_products

    @order = Order.new(user_id: current_user.id)

    if @order.save
      update_stock
      @cart.carts_products.clear
      redirect to categories_path
      flash[:success] = "Your order has been placed!"
    else
      flash[:danger] = "Your order could not be completed."
    end
  end

private
  def update_stock
    @carts_products.each do |carts_product|
      carts_product.product.quantity -= carts_product.quantity
      carts_product.order_id = @order.id
      carts_product.save
      carts_product.product.save
    end
  end
end
