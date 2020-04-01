class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update]

  def index
    @items = Item.includes(:images).order('created_at DESC').page(params[:page]).per(3)
    @lady_items = Item.where(category_id: 1).where.not(business_stats: 2).limit(4).order(id: "DESC")
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
    @user = User.find(@item.seller_id)
    @item_images = @item.images
  end

  def edit
     # 親セレクトボックスの初期値(配列)
     @category_parent_array = []
     # categoriesテーブルから親カテゴリーのみを抽出、配列に格納
     array = Category.where(ancestry: nil).pluck(:name)
     @category_parent_array.push(array)
     @category_parent_array.flatten!
     # itemに紐づいていいる孫カテゴリーの親である子カテゴリが属している子カテゴリーの一覧を配列で取得
     @category_child_array = @item.category.parent.parent.children
 
     # itemに紐づいていいる孫カテゴリーが属している孫カテゴリーの一覧を配列で取得
     @category_grandchild_array = @item.category.parent.children
  end

  def update
    category_id_params
    if @item.update(item_params)
      redirect_to root_path
    else
      redirect_to edit_item_path
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
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
    params.require(:item).permit(:name, :description, :bland, :category_id, :status, :delivery_charge_id, :prefecture_id, :delivery_date_id, :price, images_attributes: [:src]).merge(seller_id: current_user.id)
  end

  def category_id_params
    category = params.permit(:category_id)
    @item[:category_id] = category[:category_id]
  end
  
  def set_item
    @item = Item.find(params[:id])
  end

end