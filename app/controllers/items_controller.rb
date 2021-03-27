class ItemsController < ApplicationController

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = item.new(item_params)
    if @item.save
      redirect_to #root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:category_id, :states_id, :charge_id, :area_id, :date_id)
  end

end
