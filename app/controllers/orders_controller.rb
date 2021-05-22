class OrdersController < ApplicationController

  def new
    @customer = Customer.find(1)
    @order = Order.new
  end

  def confirm
  end

  def create
  end

  def complete
  end

  def index
  end

  def show
  end

end
