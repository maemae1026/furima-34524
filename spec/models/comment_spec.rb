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
        expect(@comment.errors.full_messages).to include 'Comment is invalid'
      end
      it 'userが紐付いていないと保存できないこと' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('User must exist')
      end
      it 'itemが紐付いていないと保存できないこと' do
        @comment.item = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Item translation missing: ja.activerecord.errors.models.comment.attributes.item.required')
      end
    end
  end
end
