class ItemsController < ApplicationController
  before_action :move_to_new, only: [:new, :edit, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    binding.pry
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :description, :category_id, :status_id, :charge_type_id, :area_id, :day_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def move_to_new
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_index
    item = Item.find(params[:id])
    redirect_to root_path unless current_user.id == item.user_id && item.management.nil?
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
