require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user_id: @user.id)
    @user2 = FactoryBot.create(:user)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: @user2.id, item_id: @item.id)
    sleep 0.1
  end

  describe '商品が購入できる' do
    context '登録情報が正しいとき' do
      it '全ての値が正しければ購入できること' do
        @purchase_address.valid?
        expect(@purchase_address).to be_valid
      end
      it '建物情報(building)が空でも登録できること' do
        @purchase_address.building = ''
        @purchase_address.valid?
        expect(@purchase_address).to be_valid
      end
    end

    context '登録情報が誤っているとき' do
      it 'tokenが空のとき' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空のとき' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号が"-"を含まないとき' do
        @purchase_address.postal_code = '1111111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code is invalid')
      end
      it 'エリアIDが１のとき' do
        @purchase_address.area_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Area must be other than 1')
      end
      it '市区町村が空のとき' do
        @purchase_address.municipality = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空のとき' do
        @purchase_address.address = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空のとき' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が10〜11桁でないとき' do
        @purchase_address.phone_number = '123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が12桁以上のとき' do
        @purchase_address.phone_number = '123456789012'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が英数混合のとき' do
        @purchase_address.phone_number = '12345abcdf'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'user_idが空のとき' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空のとき' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
