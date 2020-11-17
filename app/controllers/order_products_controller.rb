class OrderProductsController < ApplicationController
    before_action :set_order
    before_action :set_order_product, except: :create
  
    def create
      @order_product = @order.order_products.new(order_params)
      @order_product.user_id = current_user.id
      @order_product.product_id = params([:product_id])
      puts "HERE"
      @order.save
      pp @order_product
      session[:order_id] = @order.id
    end
  
    def update
      @order_product.update_attributes(order_params)
      @order_products = current_order.order_products
    end
  
    def destroy
      @order_product.destroy
      @order_products = current_order.order_products
    end
  
    private
    def set_order
      @order = current_order
    end
  
    def set_order_product
      @order_product = @order.order_products.find(params[:id])
    end
  
    def order_params
      params.require(:order_product).permit(:product_id, :quantity, :user_id)
    end  
end
