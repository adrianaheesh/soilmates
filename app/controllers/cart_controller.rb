class CartController < ApplicationController
  def show
    @order_products = current_order.order_products
  end
end
