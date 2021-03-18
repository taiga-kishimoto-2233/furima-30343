require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザ情報" do
    it "ニックネームが必須であること" do
      user = FactoryBot.build(:user)
      user.nickname = ""
      user.valid?
      expect( user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "メールアドレスが必須であること" do
      user = FactoryBot.build(:user)
      user.email = ""
      user.valid?
      expect( user.errors.full_messages).to include("Email can't be blank")
    end
    it "メールアドレスが一意性であること" do
      user = FactoryBot.create(:user)
      user2 = FactoryBot.build(:user)
      user2.nickname = "test234"
      user2.valid?
      expect(user2).not_to be_valid
    end
    it "メールアドレスは、@を含む必要があること" do
      user = FactoryBot.build(:user)
      user.email = "testtest.com"
      user.valid?
      expect( user.errors.full_messages).to include("Email is invalid")
    end
    it "パスワードが必須であること" do
      user = FactoryBot.build(:user)
      user.password = ""
      user.valid?
      expect( user.errors.full_messages).to include("Password can't be blank")
    end
    it "パスワードは、6文字以上での入力が必須であること" do
      user = FactoryBot.build(:user)
      user.password = "test1"
      user.valid?
      expect( user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "パスワードは、半角英数字混合での入力が必須であること" do
      user = FactoryBot.build(:user)
      user.password = "123456"
      user.valid?
      expect( user.errors.full_messages).to include("Password is invalid")
    end
    it "パスワードは、確認用を含めて2回入力すること" do
      user = FactoryBot.build(:user)
      user.password_confirmation = ""
      user.valid?
      expect( user.errors.full_messages).to include("Password confirmation can't be blank")
    end
    it "パスワードとパスワード（確認用）、値の一致が必須であること" do
      user = FactoryBot.build(:user)
      user.password_confirmation = "test234"
      user.valid?
      expect( user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end

  describe "本人情報確認" do
    it "ユーザー本名は、名字と名前がそれぞれ必須であること" do
      user = FactoryBot.build(:user)
      user.last_name = ""
      user.first_name = ""
      user.valid?
      expect( user.errors.full_messages).to include("Last name can't be blank", "First name can't be blank")
    end
    it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      user = FactoryBot.build(:user)
      user.last_name = "test"
      user.first_name = "test"
      user.valid?
      expect( user.errors.full_messages).to include("Last name is invalid", "First name is invalid")
    end
    it "ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること" do
      user = FactoryBot.build(:user)
      user.last_name_f = ""
      user.first_name_f = ""
      user.valid?
      expect( user.errors.full_messages).to include("Last name f can't be blank", "First name f can't be blank")
    end
    it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること" do
      user = FactoryBot.build(:user)
      user.last_name_f = "う"
      user.first_name_f = "う"
      user.valid?
      expect( user.errors.full_messages).to include("Last name f is invalid", "First name f is invalid")
    end
    it "生年月日が必須であること" do
      user = FactoryBot.build(:user)
      user.birthday = ""
      user.valid?
      expect( user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
