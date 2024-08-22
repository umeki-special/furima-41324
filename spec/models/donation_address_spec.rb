require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, item_id: @item.id, user_id: @user.id)
  end
  describe '寄付情報の保存' do
    context '保存できる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_form).to be_valid
      end

      it 'address2は空でも保存できること' do
        @order_form.address2 = nil
        expect(@order_form).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @order_form.post_code = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeの形式が無効だと保存できないこと' do
        @order_form.post_code = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code is invalid. Enter it as 123-4567.")
      end

      it 'prefecture_idが空だと保存できないこと' do
        @order_form.prefecture_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture must be selected")
      end

      it 'prefecture_idが無効だと保存できないこと' do
        @order_form.prefecture_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture must be selected")
      end

      it 'cityが空だと保存できないこと' do
        @order_form.city = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
    
      it 'addressが空だと保存できないこと' do
        @order_form.address = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end
    
      it 'phone_numberが空だと保存できないこと' do
        @order_form.phone_number = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberの形式が無効だと保存できないこと' do
        @order_form.phone_number = '123-456-7890'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid. Input only number without hyphen.")
      end

      it 'phone_numberの長さが無効だと保存できないこと（短すぎる場合）' do
        @order_form.phone_number = '123456789'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)")
      end

      it 'phone_numberの長さが無効だと保存できないこと（長すぎる場合）' do
        @order_form.phone_number = '123456789012'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end

      it 'tokenが空だと保存できないこと' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end

      it 'tokenが無効だと保存できないこと' do
        @order_form.token = 'invalid_token'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token is invalid")
      end
    end
  end
end
