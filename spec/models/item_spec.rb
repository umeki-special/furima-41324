# spec/models/item_spec.rb
require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.create(:item)
  end

  describe '商品情報の登録' do
    context '正常な場合' do
      it '全ての属性が正しく設定されていれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '異常な場合' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors[:name]).to include("can't be blank")
      end

      it 'description_of_itemが空では登録できない' do
        @item.description_of_item = ''
        @item.valid?
        expect(@item.errors[:description_of_item]).to include("can't be blank")
      end

      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors[:price]).to include("can't be blank")
      end

      it 'priceが300未満では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors[:price]).to include("must be greater than or equal to 300")
      end

      it 'priceが9999999を超えると登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors[:price]).to include("must be less than or equal to 9999999")
      end

      it 'category_idが1（---）では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors[:category_id]).to include("can't be '---'")
      end

      it 'status_idが1（---）では登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors[:status_id]).to include("can't be '---'")
      end

      it 'shipping_method_idが1（---）では登録できない' do
        @item.shipping_method_id = 1
        @item.valid?
        expect(@item.errors[:shipping_method_id]).to include("can't be '---'")
      end

      it 'region_of_origin_idが1（---）では登録できない' do
        @item.region_of_origin_id = 1
        @item.valid?
        expect(@item.errors[:region_of_origin_id]).to include("can't be '---'")
      end

      it 'estimated_shipping_date_idが1（---）では登録できない' do
        @item.estimated_shipping_date_id = 1
        @item.valid?
        expect(@item.errors[:estimated_shipping_date_id]).to include("can't be '---'")
      end

      it 'imageが添付されていない場合、登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors[:image]).to include("No image attached. Please select an image")
      end

      it 'userが紐づいていなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors[:user]).to include("must exist")
      end

      it 'priceに全角文字を含むと登録できない' do
        @item.price = '３０００'
        @item.valid?
        expect(@item.errors[:price]).to include("is not a number")
    end
  end
end
