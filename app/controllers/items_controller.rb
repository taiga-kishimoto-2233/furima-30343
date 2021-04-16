class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.all.order(created_at: :desc)
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :states_id, :charge_id, :area_id, :exhibit_date_id,
                                 :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    # if @purchases.item.present?
    #   redirect_to action: :index
    # else
    if user_signed_in?
      redirect_to action: :index unless current_user.items.find_by(id: params[:id])
    else
      redirect_to new_user_session_path
    end
    # end
  end
end
