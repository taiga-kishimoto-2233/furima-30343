require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  describe '商品が購入できる' do
    context '登録情報が正しいとき' do
      it '全ての値が正しければ購入できること' do
        @purchase_address.valid?
        expect(@purchase_address).to be_valid
      end
    end

    context '登録情報が誤っているとき' do
      it 'カード情報が空のとき' do
        @purchase_address.number = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Number can't be blank")
      end
      it 'カードの有効期限(月)が空のとき' do
        @purchase_address.exp_month = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Exp month can't be blank")
      end
      it 'カードの有効期限(年)が空のとき' do
        @purchase_address.exp_year = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Exp year can't be blank")
      end
      it 'cvcが空のとき' do
        @purchase_address.cvc = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Cvc can't be blank")
      end
      it '郵便番号が空のとき' do
        @purchase_address.postal_code = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号が"-"を含まないとき' do
        @purchase_address.postal_code = '1111111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid")
      end
      it 'エリアIDが１のとき' do
        @purchase_address.area_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Area must be other than 1")
      end
      it '市区町村が空のとき' do
        @purchase_address.municipality = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空のとき' do
        @purchase_address.address = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空のとき' do
        @purchase_address.phone_number = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が10〜11桁でないとき' do
        @purchase_address.phone_number = '123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
