require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の新規出品できる' do
    context '商品の情報が新規登録ができるとき' do
      it '全ての値が正しければ登録できること' do
        @item.valid?
        expect(@item).to be_valid
      end
    end

    context '商品の新規出品ができないとき' do
      it '商品画像を1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が必須であること' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が必須であること' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'カテゴリーの情報が必須であること' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態についての情報が必須であること' do
        @item.states_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("States can't be blank")
      end
      it '配送料の負担についての情報が必須であること' do
        @item.charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank")
      end
      it '発送元の地域についての情報が必須であること' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it '発送までの日数についての情報が必須であること' do
        @item.exhibit_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Exhibit date can't be blank")
      end
      it '価格についての情報が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が、¥300未満では保存できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '価格が、¥9,999,999より高いと保存でいないこと' do
        @item.price = 10,000,000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '販売価格は全角数字では保存できないこと' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '販売価格は半角英数字混合では保存できないこと' do
        @item.price = '1test1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '販売価格は半角英語だけでは保存できないこと' do
        @item.price = 'test'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'アクティブハッシュを利用するカラムは、ID:1が登録できないこと' do
        @item.category_id = 1
        @item.states_id = 1
        @item.charge_id = 1
        @item.area_id = 1
        @item.exhibit_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1', 'States must be other than 1', 'Charge must be other than 1', 'Area must be other than 1', 'Exhibit date must be other than 1')
      end
    end
  end
end
