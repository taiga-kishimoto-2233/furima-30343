require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザ新規登録' do
    context 'ユーザ新規登録ができるとき' do
      it '全ての値が正しければ登録できること' do
        @user.valid?
        expect(@user).to be_valid
      end
    end

    context 'ユーザ新規登録ができないとき' do
      it 'ニックネームが空だと登録できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが空だと登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスが重複すると登録できないこと' do
        @user = FactoryBot.create(:user)
        user2 = FactoryBot.build(:user)
        user2.email = @user.email
        user2.valid?
        expect(user2).not_to be_valid
      end
      it 'メールアドレスは、@を含まないと登録できないこと' do
        @user.email = 'testtest.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードが空だと登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードは、5文字以下だと登録できないこと' do
        @user.password = 'test1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードは、半角英語のみでは登録できないこと' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワードは、数字のみでは登録できないこと' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワードは、全角英数字混合では登録できないこと' do
        @user.password = 'ABC１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワードは、確認用を含めて2回入力しないと登録できないこと' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
      end
      it 'パスワードとパスワード（確認用）の値が一致しないと登録できないこと' do
        @user.password_confirmation = 'test234'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'ユーザー本名は、名字と名前がそれぞれ入力しないと登録できないこと' do
        @user.last_name = ''
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "First name can't be blank")
      end
      it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）で入力しないと登録できないこと' do
        @user.last_name = 'test'
        @user.first_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid', 'First name is invalid')
      end
      it 'ユーザー本名のフリガナは、名字と名前でそれぞれ入力しないと登録できないこと' do
        @user.last_name_f = ''
        @user.first_name_f = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name f can't be blank", "First name f can't be blank")
      end
      it 'ユーザー本名のフリガナは、全角（カタカナ）での入力しないと登録できないこと' do
        @user.last_name_f = 'う'
        @user.first_name_f = 'う'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name f is invalid', 'First name f is invalid')
      end
      it '生年月日が空だと登録できないこと' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
