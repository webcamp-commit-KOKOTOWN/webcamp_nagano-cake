class Admin::ItemsController < ApplicationController
    before_action :set_item, only: [:show, :edit, :update]
    before_action :set_genres, only: [:new, :edit, :index, :create, :update]
    before_action :authenticate_admin!


def new
    @item = Item.new
end

def create
    @item = Item.new(item_params)
    if @item.save
        flash[:notice] = "商品を登録しました"
        redirect_to admin_items_path(@item)
    else
        render :new
    end
end

def index
    @items = Item.all.page(params[:page]).per(10)
end

def show
end

def edit
end

def update
    if @item.update(item_params)
        flash[:success] = "商品詳細を変更しました"
        redirect_to admin_items_path(@item)
    else
        render :edit
    end
end

private

def item_params
    params.require(:item).permit(:name, :image, :description, :genre_id, :price, :sale_status)
end

def set_genres
    @genres = Genre.where(is_valid: true)
end

end