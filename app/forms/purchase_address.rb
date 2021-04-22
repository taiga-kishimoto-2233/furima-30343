class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :user_id,
                :item_id,
                # :token,
                :number,
                :exp_month,
                :exp_year,
                :cvc,
                :postal_code,
                :area_id,
                :municipality,
                :address,
                :building,
                :phone_number

  with_options presence: true do
    # purchaseモデルのバリデーション
    validates :user_id,
              :item_id,
              # :token
              :number,
              :exp_month,
              :exp_year,
              :cvc
    # addressモデルのバリデーション
    validates :postal_code,
              :area_id,
              :municipality,
              :address,
              :building,
              :phone_number
    validates :area_id, numericality: { other_than: 1 }
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end

  def save
    # 購入の情報を保存
    purchase = Purchase.create(
      user_id: user_id,
      item_id: item_id,
      # token: token
      # number: number,
      # exp_month: exp_month,
      # exp_year: exp_year,
      # cvc: cvc
      # price: item.price
    )
    # 住所の情報を保存
    Address.create(
      postal_code: postal_code,
      area_id: area_id,
      municipality: municipality,
      address: address,
      building: building,
      phone_number: phone_number,
      purchase_id: purchase.id
    )
  end
end