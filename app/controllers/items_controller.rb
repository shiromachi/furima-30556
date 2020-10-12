class ItemsController < ApplicationController
  
  def index
    @item = Item.all
  end

  def new
    @item = Item.new
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
    params.require(:item).permit(:image, :title, :description, :category_id, :status_id, :charge_type_id, :area_id, :day_to_ship_id, :price).merge(user_id: current_user.id)
  end
end
