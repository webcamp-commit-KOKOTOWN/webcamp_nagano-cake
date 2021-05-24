class OrdersController < ApplicationController

  def new
    @customer = Customer.find(current_customer.id)
    @cart_items = @customer.cart_items.all
  end

  def confirm
    @customer = Customer.find(current_customer.id)
    @carts = @customer.cart_items.all
    @order = Order.new(order_params)
    @order.customer_id = @customer.id
    if params[:address_select] == "current"
      @order.postal_code = @customer.postal_code
      @order.address = @customer.address
      @order.name = "#{@customer.last_name}#{@customer.first_name}"
    elsif params[:address_select] == "registered"
      address = Address.find(params[:address_registered].to_i)
      @order.postal_code = address.postal_code
      @order.address = address.address
      @order.name = address.name
    elsif params[:address_select] == "other"
      @order.postal_code = params[:postal_code]
      @order.address = params[:address]
      @order.name = params[:name]
    end
  end

  def create
    order = Order.new(order_params)
    order.save
    customer = Customer.find(current_customer.id)
    carts = customer.cart_items.all
    carts.each do |cart|
      order_item = OrderItem.new(order_id: order.id, item_id: cart.item_id, price: cart.item.tax_calc, quantity: cart.quantity)
      order_item.save
      cart.destroy
    end
    redirect_to orders_complete_path
  end

  def complete
  end

  def index
    @customer = Customer.find(current_customer.id)
    @orders = @customer.orders.all
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items.all
  end


  private

  def order_params
    params.permit(:name, :postal_code, :address, :payment_option, :total_payment, :customer_id)
  end

end
