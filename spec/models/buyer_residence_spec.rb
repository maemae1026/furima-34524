require 'rails_helper'

RSpec.describe BuyerResidence, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buyer_residence = FactoryBot.build(:buyer_residence, user_id: user.id, item_id: item.id)
      sleep(0.1)
    end

    context '商品が購入できるとき' do
      it '商品購入に必要な情報が全て正しく保存できること' do
        expect(@buyer_residence).to be_valid
      end
    end
    context '商品が購入できないとき' do
      it '郵便番号の保存にはハイフンが必要であること' do
        @buyer_residence.postal_code = 1_234_567
        @buyer_residence.valid?
        expect(@buyer_residence.errors.full_messages).to include 'Postal code is invalid'
      end
      it '電話番号は11桁以内の数値のみ保存可能であること' do
        @buyer_residence.phone_number = '0a0a0a0a0a0'
        @buyer_residence.valid?
        expect(@buyer_residence.errors.full_messages).to include 'Phone number is invalid'
      end
      it '購入には郵便番号が必要であること' do
        @buyer_residence.postal_code = ''
        @buyer_residence.valid?
        expect(@buyer_residence.errors.full_messages).to include "Postal code can't be blank"
      end
      it '購入には都道府県が必要であること' do
        @buyer_residence.prefecture_id = ''
        @buyer_residence.valid?
        expect(@buyer_residence.errors.full_messages).to include "Prefecture can't be blank"
      end
      it '購入には市区町村が必要であること' do
        @buyer_residence.city = ''
        @buyer_residence.valid?
        expect(@buyer_residence.errors.full_messages).to include "City can't be blank"
      end
      it '購入には番地が必要であること' do
        @buyer_residence.house_number = ''
        @buyer_residence.valid?
        expect(@buyer_residence.errors.full_messages).to include "House number can't be blank"
      end
      it '購入には電話番号が必要であること' do
        @buyer_residence.phone_number = ''
        @buyer_residence.valid?
        expect(@buyer_residence.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'tokenが空では登録できないこと' do
        @buyer_residence.token = nil
        @buyer_residence.valid?
        expect(@buyer_residence.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
