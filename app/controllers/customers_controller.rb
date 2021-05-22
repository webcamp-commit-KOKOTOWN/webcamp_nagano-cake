class CustomersController < ApplicationController
  #Viewあり
  def show
    #ログインしている会員情報を検索
    @customer = Customer.find(params[:id])
  end

  def quit
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  
  #Viewなし
  def out
    @customer = Customer.find(params[:id])
    @customer.update(is_deleted: "true")
    # binding.pry
    reset_session
    redirect_to root_path
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
        flash[:notice] = "You have updated  successfully."
        redirect_to customer_path(@customer)
    else
      render 'edit'
    end
  
  end
  
  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana,:first_name_kana, :postal_code, :address, :telephone_number, :email, :is_deleted)
  end
end
