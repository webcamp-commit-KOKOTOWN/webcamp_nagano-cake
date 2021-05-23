class OrdersController < ApplicationController

  def new
    @customer = Customer.find(current_customer.id)
    @order = Order.new
  end

  def confirm
    @customer = Customer.find(current_customer.id)
    @order = Order.new(order_params)
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
  end

  def complete
  end

  def index
  end

  def show
  end


  private

  def order_params
    params.permit(:name, :postal_code, :address, :payment_option,)
  end

end
