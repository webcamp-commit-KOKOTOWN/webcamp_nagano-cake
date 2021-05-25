class Admin::OrderItemsController < ApplicationController
  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.update(params_order_item)
    redirect_to admin_order_path(params[:order_id])
  end


  private

  def params_order_item
    params.permit(:production_status)
  end
end
