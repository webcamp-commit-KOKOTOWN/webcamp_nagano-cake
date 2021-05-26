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
    flash[:notice] = "注文ステータスを更新しました"
    if @order.order_status == 1
      @order.order_items.each do |order_item|
        order_item.update(production_status: 1)
        flash[:notice] = "入金が確認できましたので、制作ステータスを更新しました"
      end
    end
    redirect_to admin_order_path(@order.id)
  end


  private

  def order_params
    params.permit(:order_status)
  end
end
