class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  def update
    od=OrderDetail.find(params[:id])
    #od.making_status=params[:order_detail][:making_status].to_i #invertにするとparams[][]は数字ではなく英語
    od.update(order_detail_params)
    
    
    #「２＝製作中」なら注文ステータスも「２＝製作中」に変更
    if od.making_status==OrderDetail.making_statuses.key(2)
      od.order.update(status: 2)
    end
    
    
    #全て「３＝製作完了」なら注文ステータスを「３＝発送準備」に更新
    ods=od.order.order_details
    f=0
    ods.each do |o|
      f=1 if o.making_status!=OrderDetail.making_statuses.key(3)
    end
    if f==0
      od.order.status=3
      od.order.save
    end
    #------------------------------------------------------------
    
    redirect_to admin_order_path(od.order)
  end
  
  
  
  private
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
