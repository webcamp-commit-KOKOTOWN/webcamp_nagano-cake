class ApplicationController < ActionController::Base
  def set_item
    @item = Item.find(params[:id])
  end
  
  def set_customer
    @customer = Customer.find(params[:id])
  end

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end
end
