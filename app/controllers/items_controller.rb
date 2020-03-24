class ItemsController < ApplicationController
  def index
    @items = Item.includes(:images).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.images.new
    @address = Prefecture.all
  end

  def create
    
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end  
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :description, :bland, :category, :status, :delivery_charge, :prefecture, :delivery_date, :price, images_attributes: [:src])
  end
end