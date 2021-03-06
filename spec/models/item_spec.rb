require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録' do
    context '商品が登録できないとき' do
      it '商品画像がないと登録できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it '商品名がないと登録できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it '商品説明がないと登録できないこと' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Text can't be blank"
      end
      it 'カテゴリーがないと登録できないこと' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it '商品状態がないと登録できないこと' do
        @item.states_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "States can't be blank"
      end
      it '配送料負担がないと登録できないこと' do
        @item.delivery_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery fee can't be blank"
      end
      it '発送元地域がないと登録できないこと' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it '発送までの日数がないと登録できないこと' do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping day can't be blank"
      end
      it '販売価格がないと登録できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it '販売価格は300以下では登録できないこと' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not included in the list'
      end
      it '販売価格は9999999以上では登録できないこと' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not included in the list'
      end
      it '販売価格は全角数字では登録できないこと' do
        @item.price = '３３３'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not included in the list'
      end
    end
    context '商品が登録できるとき' do
      it '販売価格は半角数字のみ保存可能であること' do
        @item.price = '333'
        @item.valid?
        expect(@item).to be_valid
      end
    end
  end
end
