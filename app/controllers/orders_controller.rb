class OrdersController < ApplicationController
  def index
    if @current_users_store
      @orders = Order.where(store_id: @current_users_store.id)
    else
      @orders = Order.where(user_id: current_user.id)
    end
  end

  def success
    @order = Order.create(user_id: current_user.id)
    @product = Product.find(params[:id])
    @order.store_id = @product.store_id
    puts "HERE"
    pp @order

    @order_products = OrderProducts.create(order_id: @order.id, product_id: params[:id], quantity: 1, total: params[:id].price)
  end

  # def webhook
  #   payload = request.body.read
  #   puts payload.inspect
  #   status 200
  # end

  # def update
  #   @order = Order.where(user_id: current_user.id)
  #   @order.update(paid_status: true)
  # end

  def show
  end

end
