class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order=Order.find(params[:id])
    @order_details=@order.order_details
    @total=0
    @ar_or=[]
    @ar_od=[]
    
    # x=0
    # while x<=4
    #   @ar_or.push([Order.statuses_i18n[Order.statuses.key(x)],x])#[["入金待ち", 0], ["入金確認", 1], ["製作中", 2], ["発送準備中", 3], 
    #   x+=1
    # end
    
    
    # x=0
    # while x<=3
    #   @ar_od.push([OrderDetail.making_statuses_i18n[OrderDetail.making_statuses.key(x)],x])
    #   x+=1
    # end
  
  end
  
  
  def update
    @order=Order.find(params[:id])
    #@order.status=params[:order][:status].to_i
    @order.update(order_params)
    @order.order_details.update_all(making_status: 1) if @order.status=="confirmed"
    redirect_to admin_order_path(@order)
    
  end
  def index
    @orders=Order.page(params[:page])
  end
  
  private
  def order_params
    params.require(:order).permit(:status)
  end
end
