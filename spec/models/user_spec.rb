require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it 'メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'メールアドレスは、＠を含む必要があること' do
      @user.email = 'ppppppp'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Email is invalid'
    end

    context 'パスワードが登録できるとき' do
      it 'パスワードは半角英数字混合で６文字以上であれば入力ができること' do
        @user.password = '000000d'
        @user.password_confirmation = '000000d'
        @user.valid?
        expect(@user).to be_valid
      end
    end


    context 'パスワードが登録できないとき' do
    it 'パスワードが必須であること' do
      @user.password = ''
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'パスワードは5文字以下での入力ができないこと' do
      @user.password = '0oiuy'
      @user.password_confirmation = '0oiuy'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
    end
    it 'パスワードは半角英数字のみでの入力が必須であること' do
      @user.password = '0000000'
      @user.password_confirmation = '0000000'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is invalid'
    end
    it 'パスワードは半角英語のみでの入力が必須であること' do
      @user.password = 'eeeeee'
      @user.password_confirmation = 'eeeeee'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is invalid'
    end
    it 'パスワードは全角での入力ができないこと' do
      @user.password = '000EeE'
      @user.password_confirmation = '000EeE'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is invalid'
    end
    
    it 'パスワードは、確認用含めて２回入力すること' do
      @user.password = '000000d'
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it 'パスワードとパスワード（確認用）は、値の一致が必要であること' do
      @user.password = '000000d'
      @user.password_confirmation = '0o0o0sss'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
  end

  context 'ユーザー名が登録できるとき' do

    it '名字は全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.family_name = '松本'
      @user.valid?
      expect(@user).to be_valid
    end
    it '名前は全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.first_name = '一太郎'
      @user.valid?
      expect(@user).to be_valid
    end
    it '名字のフリガナは全角（カタカナ）での入力が必須であること' do
      @user.family_name_reading = 'マツモト'
      @user.valid?
      expect(@user).to be_valid
    end
    it '名前のフリガナは全角（カタカナ）での入力が必須であること' do
      @user.first_name_reading = 'イチタロウ'
      @user.valid?
      expect(@user).to be_valid
    end
  end

  context 'ユーザー名が登録できないとき' do

    it 'ユーザー本名は、名字が必須であること' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name can't be blank"
    end
    it 'ユーザー本名は、名前が必須であること' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it 'ユーザー本名のフリガナは、名字が必須であること' do
      @user.family_name_reading = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name reading can't be blank"
    end
    it 'ユーザー本名のフリガナは、名前が必須であること' do
      @user.first_name_reading = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name reading can't be blank"
    end
  end
    
    it '生年月日が必須であること' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth day can't be blank"
    end
  end
end
