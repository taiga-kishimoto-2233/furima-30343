class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @purchase = PurchaseAddress.new
  end

  def create
    # binding.pry
    @purchase = PurchaseAddress.new(purchase_params)
    if @purchase.valid?
      @purchase.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def purchase_params
    params.permit(
      # :number,
      # :exp_month,
      # :exp_year,
      # :cvc,
      # :token,
      :postal_code,
      :area_id,
      :municipality,
      :address,
      :building,
      :phone_number)
      .merge(
        user_id: current_user.id,
        item_id: @item.id
        # price: @item.price
      )
  end
end
