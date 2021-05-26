class ItemsController < ApplicationController
    
    def index
        @items = Item.where(sale_status: true).page(params[:page]).per(8)
        @genres = Genre.all
    end

    def show
        @items = Item.all
        @item = Item.find(params[:id])
        @cart_item = CartItem.new
    end
    
    def item_params
            params[:item].permit(:image, :name, :description, :price, :sale_status)
    end
end
