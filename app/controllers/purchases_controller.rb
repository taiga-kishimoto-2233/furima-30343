class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @purchase = PurchaseAddress.new
  end

  def create
    @purchase = PurchaseAddress.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    @item = Item.find_by(price: @item.price)
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def purchase_params
    params.permit(
      :token,
      :postal_code,
      :area_id,
      :municipality,
      :address,
      :building,
      :phone_number
    )
          .merge(
            user_id: current_user.id,
            item_id: @item.id
          )
  end

  def move_to_index
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

end
