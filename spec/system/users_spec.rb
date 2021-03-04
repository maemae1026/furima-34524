require 'rails_helper'

RSpec.describe 'トップページ', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

    it 'ログアウト状態で新規登録・ログインボタンをクリックして遷移できることを確認' do
      # トップページに移動する
      visit root_path
      # トップページに新規登録、ログインへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      expect(page).to have_content('ログイン')
      #  新規登録ページへ遷移する
      click_link '新規登録'
      #  新規登録ページに推移していることを確認する
      expect(current_path).to eq(new_user_registration_path)
      # トップページに移動する
      visit root_path
      # ログインページへ遷移する
      click_link 'ログイン'
      #  ログインページに推移していることを確認する
      expect(current_path).to eq(new_user_session_path)
      
    end
  


    it 'ログイン状態で新規登録・ログアウトボタンをクリックしてログアウトできることを確認' do
      # トップページに移動する
      visit root_path
      #  新規登録ページへ遷移する
      visit new_user_registration_path
      #  ユーザー情報を入力
      fill_in 'nickname', with: @user.nickname
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      fill_in 'password-confirmation', with: @user.password_confirmation
      fill_in 'last-name', with: @user.family_name
      fill_in 'first-name', with: @user.first_name
      fill_in 'last-name-kana', with: @user.family_name_reading
      fill_in 'first-name-kana', with: @user.first_name_reading
      
      #修正中
      fill_in '生年月日', with: @user.birth_day
      # トップページに移動する
      find('input[name="commit"]').click
      #  トップページに推移していることを確認する
      expect(current_path).to eq(root_path)
      # トップページにユーザー名、ログアウトボタンがあることを確認する
      expect(page).to have_content('#{@user.nickname}')
      expect(page).to have_content('ログアウト')
      # ログアウトをする
      click_link 'ログアウト'
      # トップページに新規登録、ログインへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      expect(page).to have_content('ログイン')
    end
end
