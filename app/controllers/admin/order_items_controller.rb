class Admin::OrderItemsController < ApplicationController
  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.update(params_order_item)
    flash[:notice] = "制作ステータスが更新されました"
    if @order_item.production_status == 2
      @order_item.order.update(order_status: 2)
    elsif @order_item.production_status == 3
      order_items = @order_item.order.order_items
      finished = true
      order_items.each do |order_item|
        if order_item.production_status != 3
          finished = false
        end
      end
      if finished == true
        order = @order_item.order
        order.update(order_status: 3)
        flash[:notice] = "全ての商品の制作が完了したため、注文ステータスを更新しました"
      end
    end
    redirect_to admin_order_path(params[:order_id])
  end


  private

  def params_order_item
    params.permit(:production_status)
  end
end
