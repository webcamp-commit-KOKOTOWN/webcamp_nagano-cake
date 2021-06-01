class HomesController < ApplicationController
  def top
        @items = Item.where(sale_status: true).page(params[:page]).per(8)
        @genres = Genre.all
  end

  def about
  end
end
