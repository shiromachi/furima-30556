class ManagementsController < ApplicationController
  before_action :move_to_new, only: :index
  before_action :move_to_top, only: :index
  before_action :move_to_page, only: :index

  def index
    @management_order = ManagementOrder.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @management_order = ManagementOrder.new(management_params)
    if @management_order.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item.price,
        card: management_params[:token],
        currency: 'jpy'
      )
      @management_order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def management_params
    params.permit(:item_id, :postal_code, :region_id, :city, :street, :building, :phone).merge(user_id: current_user.id, token: params[:token], management_id: params[:management_id])
  end

  def move_to_new
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_top
    item = Item.find(params[:item_id])
    redirect_to root_path if item.management.present?
  end

  def move_to_page
    item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == item.user_id
  end
end
