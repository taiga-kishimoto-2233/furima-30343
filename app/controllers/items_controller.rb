class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :states_id, :charge_id, :area_id, :date_id).merge(user_id: current_user.id)
  end

end
