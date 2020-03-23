class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to root_path
  end
  
  private
  def item_params
    params.permit(:name, :description, :category, :status, :delivery_charge, :prefecture, :delivery_date, :price)
  end
end