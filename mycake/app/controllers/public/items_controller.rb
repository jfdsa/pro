class Public::ItemsController < ApplicationController
  
  def index
    @items=Item.all
    @genres=Genre.all
    @k=0
    @items.each do |a|
      @k+=1 unless a.is_active
    end
    unless params[:g_id].nil?
      @items=Item.where(genre_id: params[:g_id])
    end
  end

  def show
    @item=Item.find(params[:id])
    @genres=Genre.all
    @cart_item=CartItem.new
  end
end
