class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @cart_items=current_customer.cart_items
    @total=0
    @flag=@cart_items.count==0 ? true : false
  end
  
  def create
    if @cart_item=current_customer.cart_items.find_by(item_id: cart_item_params[:item_id])
      @cart_item.amount+=cart_item_params[:amount].to_i
      @cart_item.save
    else
      @cart_item=CartItem.new(cart_item_params)
      @cart_item.customer_id=current_customer.id
      @cart_item.save
    end
    redirect_to cart_items_path
  end
  
  def update
    cart_item=CartItem.find(params[:id])
    cart_item.amount=cart_item_params[:amount].to_i
    cart_item.save
    redirect_to cart_items_path
  end
  
  def destroy
    cart_item=CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end
  
  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
