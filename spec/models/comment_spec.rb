require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '商品購入' do
    before do
      @comment = FactoryBot.build(:comment)
    end

    context 'コメントできるとき' do
      it 'user_idとitem_idとテキストに文字があれば保存できること' do
        expect(@comment).to be_valid
      end
    end
    context 'コメントできないとき' do
      it 'コメントの保存はテキストが空では保存できないこと' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include 'Textを入力してください'
      end
      it 'userが紐付いていないと保存できないこと' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include 'Userを入力してください'
      end
      it 'itemが紐付いていないと保存できないこと' do
        @comment.item = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include 'Itemを入力してください'
      end
    end
  end
end
