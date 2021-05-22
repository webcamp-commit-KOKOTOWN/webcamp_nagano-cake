class OrdersController < ApplicationController

  def new
    @user = User.find(current_user.id)
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
