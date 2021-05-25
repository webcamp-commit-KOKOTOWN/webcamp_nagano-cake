class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items.all
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order.id)
  end


  private

  def order_params
    params.permit(:order_status)
  end
end
