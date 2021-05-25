class AddressesController < ApplicationController
 before_action :authenticate_customer!
  def index
      @addresses = Address.all
      @address = Address.new
  end
  
  def create
      address = current_customer.addresses.new(address_params)
      if address.save
      flash[:notice] = "住所を追加しました"
      redirect_to addresses_path
      end
  end
    
  def edit
      @address = Address.find(params[:id])
  end
  
  def update
      @address = Address.find(params[:id])
      if @address.update(address_params)
      flash[:notice] = "住所を変更しました"
      redirect_to addresses_path
      end
  end
  
  def destroy
      address = Address.find(params[:id])
      address.destroy
      redirect_to addresses_path
  end
  
  private
  
  def address_params
      params.require(:address).permit(:name, :postal_code, :address)
  end
  
  
end
