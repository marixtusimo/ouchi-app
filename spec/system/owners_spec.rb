require 'rails_helper'

RSpec.describe "Owners", type: :system do
  before do
    @owner = FactoryBot.build(:owner)
  end

  context 'オーナーが新規登録できるとき' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      visit root_path
      #トップページに遷移先があることを確認
      expect(page).to have_content('SignIn(owner)')
      visit new_owner_registration_path
      #新規登録ページへ移動
      fill_in 'NickName', with: @owner.name
      fill_in 'E-Mail', with: @owner.email
      fill_in 'Password(半角英数混合)', with: @owner.password
      fill_in 'Age', with: @owner.age
      #ユーザー情報を入力できることを確認
      expect{
        find('input[type="submit"]').click
      }.to change { Owner.count }.by(1)
      #サインアップするとユーザーモデルカウントが１上がることを確認
      expect(current_path).to eq(root_path)
      #トップページに遷移することを確認
    end
  end

  context 'ユーザーが新規登録できないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      visit root_path
      #トップページに遷移先があることを確認
      expect(page).to have_content('SignIn(owner)')
      visit new_owner_registration_path
      #新規登録ページへ移動
      fill_in 'NickName', with: ''
      fill_in 'E-Mail', with: ''
      fill_in 'Password(半角英数混合)', with: ''
      fill_in 'Age', with: ''
      #ユーザー情報を入力できることを確認
      expect{
        find('input[type="submit"]').click
      }.to change { Owner.count }.by(0)
      #サインアップするとユーザーモデルカウントが１上がることを確認
      expect(current_path).to eq owner_registration_path
      #トップページに遷移することを確認
    end
  end
  context 'ログインできるとき' do
    it '保存されているユーザーの情報と合致すればログインできる' do
      visit root_path
      expect(page).to have_content('Login(owner)')
      visit new_owner_session_path
      fill_in 'E-Mail', with: @owner.email
      fill_in 'PassWord（半角英数混合6文字以上）', with: @owner.password
      find('input[type="submit"]').click
    end
  end

  context 'ログインできないとき' do
    it '保存されているユーザーの情報と合致しないとログインできない' do
      visit root_path
      expect(page).to have_content('Login(owner)')
      visit new_owner_session_path
      fill_in 'E-Mail', with: ''
      fill_in 'PassWord（半角英数混合6文字以上）', with: ''
      find('input[type="submit"]').click
      expect(current_path).to eq(new_owner_session_path)
    end
  end
end
