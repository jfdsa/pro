class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def new
    @item=Item.new
  end
  
  def index
    @items=Item.page(params[:page])
    unless params[:word].nil?
      @items=Item.where(name: params[:word]).page(params[:page])
    end
  end
  
  def create
    @item=Item.new(item_params)
    if @item.save
      flash[:notice]="アイテム登録完了"
      redirect_to admin_item_path(@item.id)
    else
      render :new
    end
    
  end
  
  def show
  end
  
  def edit
  end
  
  def update
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :genre_id, :is_active, :image)
  end
end
