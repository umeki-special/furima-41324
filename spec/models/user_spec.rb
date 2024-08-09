require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '正常系' do
      it '全ての項目が入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '異常系' do
      # ニックネーム
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      # メールアドレス
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it '重複したemailは登録できない' do
        another_user = FactoryBot.create(:user, email: 'test@example.com')
        @user.email = 'test@example.com'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email has already been taken"
      end

      it 'emailに@を含まない場合は登録できない' do
        @user.email = 'testexample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end

      # パスワード
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it 'passwordが6文字未満では登録できない' do
        @user.password = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end

      it '英字のみのpasswordでは登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end

      it '数字のみのpasswordでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end

      it '全角文字を含むpasswordでは登録できない' do
        @user.password = 'パスワード123'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end

      it 'passwordとpassword_confirmationが不一致だと登録できない' do
        @user.password = 'password123'
        @user.password_confirmation = 'password321'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      # 姓・名（全角）
      it '姓（全角）が空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end

      it '姓（全角）に半角文字が含まれていると登録できない' do
        @user.last_name = 'Tanaka1'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid"
      end

      it '名（全角）が空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end

      it '名（全角）に半角文字が含まれていると登録できない' do
        @user.first_name = 'Taro1'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid"
      end

      # 姓・名（カナ）
      it '姓（カナ）が空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end

      it '姓（カナ）にカタカナ以外の文字が含まれていると登録できない' do
        @user.last_name_kana = '田中'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana is invalid"
      end

      it '名（カナ）が空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end

      it '名（カナ）にカタカナ以外の文字が含まれていると登録できない' do
        @user.first_name_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana is invalid"
      end

      # 生年月日
      it '生年月日が空だと登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth date can't be blank"
      end
    end
  end
end
