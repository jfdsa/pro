class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order=Order.new
  end

  def confirm
    @total=0
    @cart_items=current_customer.cart_items###############
    cu=current_customer
    @order=Order.new(order_params)
    @order.shipping_cost=1000
    if params[:order][:select_address].to_i==0
      @order.postal_code=cu.postal_code
      @order.address=cu.address
      @order.name=cu.last_name+cu.first_name
    elsif params[:order][:select_address].to_i==1
      ad=Address.find(params[:order][:address_id])
      @order.postal_code=ad.postal_code
      @order.address=ad.address
      @order.name=ad.name
      
    end
    
  end
  
  def create
    @order=Order.new(order_params)
    @order.customer_id=current_customer.id
    
    if @order.save
      cart_items=current_customer.cart_items
      cart_items.each do |c|
        order_detail=OrderDetail.new
        order_detail.item_id=c.item_id
        order_detail.order_id=@order.id
        order_detail.price=c.item.with_tax
        order_detail.amount=c.amount
        order_detail.save
      end
      cart_items.destroy_all
      redirect_to orders_complete_path
    else
      redirect_to new_order_path
    end
  end

  def complete
  end

  def index
  end

  def show
  end
  
  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_cost, :total_payment)
  end
end
