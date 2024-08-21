require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
    @order_form = FactoryBot.build(:order_form, item_id: @item.id, user_id: @user.id, token: 'tok_abcdefghijk00000000000000000')
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

      it 'buildingは空でも保存できること' do
        @order_form.building = nil
        expect(@order_form).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @order_form.post_code = nil
        @order_form.valid?
        expect(@order_form.errors[:post_code]).to include("を入力してください")
      end

      it 'prefecture_idが空だと保存できないこと' do
        @order_form.prefecture_id = nil
        @order_form.valid?
        expect(@order_form.errors[:prefecture_id]).to include("を入力してください")
      end
    
      it 'cityが空だと保存できないこと' do
        @order_form.city = nil
        @order_form.valid?
        expect(@order_form.errors[:city]).to include("を入力してください")
      end
    
      it 'addressが空だと保存できないこと' do
        @order_form.address = nil
        @order_form.valid?
        expect(@order_form.errors[:address]).to include("を入力してください")
      end
    
      it 'phone_numberが空だと保存できないこと' do
        @order_form.phone_number = nil
        @order_form.valid?
        expect(@order_form.errors[:phone_number]).to include("を入力してください")
      end
    end
  end
end
