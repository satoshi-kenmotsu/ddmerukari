class ItemsController < ApplicationController
  def index
    @items = Item.includes(:images).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.images.new
    @address = Prefecture.all
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def create
    @item = Item.new(item_params)
    category_id_params
    if @item.save
      redirect_to root_path
    else
      render :new
    end  
  end

  def show
    @item = Item.find(params[:id])
    @prefecture = Prefecture.find(params[:id])
    @delivery_date = Delivery_date.find(params[:id])
    @delivery_charge = Delivery_charge.find(params[:id])

  end

  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :description, :bland, :category_id, :status, :delivery_charge, :prefecture_id, :delivery_date, :price, images_attributes: [:src])
  end

  def category_id_params
    category = params.permit(:category_id)
    @item[:category_id] = category[:category_id]
  end
  

end