class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
    @customer=current_customer
  end

  def edit
    @customer=current_customer
  end

  def unsubscribe
  end
  
  def update
    @customer=current_customer
    if @customer.update(customer_params)
      flash[:notice]="You have updated user-information successfully."
      redirect_to my_page_path
    else
      render :edit
    end
  end
  
  def withdraw
    current_customer.update(is_active: false)
    reset_session
    flash[:notice]="退会処理完了"
    redirect_to root_path
  end
  
  
  
  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end
end
