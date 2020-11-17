class OrdersController < ApplicationController
  # def index
  #   if @user_has_a_store
  #     @orders = Order.where(store_id: current_user.store.id)
  #   end
  # end

  def success
    @order = Order.new(user_id: current_user.id, paid_status: true)
    #assign product to the order for the view
    @order_product = Product.find(params[:id])
    @order.store_id = @order_product.store_id
    @order.save
    # update product so no longer available
    @order_product.update(availability: false)
  end

  # def update
  #   @order.update(order_params)
  # end

  # def show
  #   @order.find(params[:id])
  # end

  # private
  # def order_params
  #   params.require(:order).permit(:store_id, :user_id, :paid_status, :completed)
  # end
end
