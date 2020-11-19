class OrdersController < ApplicationController
  def success
    @order = Order.new(user_id: current_user.id, paid_status: true)
    
    #assign product to the order for the view
    @order_product = Product.find(params[:id])
    @order.store_id = @order_product.store_id
    @order.save

    # update product so no longer available
    @order_product.update_attribute(:availability, false)
  end
end
