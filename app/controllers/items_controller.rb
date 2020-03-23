class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render "items/new"
    end  
  end
  
  private
  def item_params
    params.permit(:name, :description, :bland, :category, :status, :delivery_charge, :prefecture, :delivery_date, :price)
  end
end