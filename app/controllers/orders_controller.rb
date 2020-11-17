class OrdersController < ApplicationController
  def index
    if @current_users_store
      @orders = Order.where(store_id: @current_users_store.id).find
    else
      @orders = Order.where(user_id: current_user.id)
    end
  end

  def success
    @order = Order.new(user_id: current_user.id)
    #assign product to the order for the view
    @order_product = Product.find(params[:id])
    @order.store_id = @order_product.store_id
    @order.save
    # update product so no longer available
    @order_product.update(availability: false)
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

  # def show
  # end

end
