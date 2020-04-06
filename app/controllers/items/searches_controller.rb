class Items::SearchesController < ApplicationController
  def index
    @item = Item.search(params[:keyword])
  end
end
