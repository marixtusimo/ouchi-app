require 'rails_helper'

RSpec.describe Owner, type: :model do
  before do
    @owner = FactoryBot.build(:owner)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it "すべての情報が入力されていなければ登録できない" do
        expect(@owner).to be_valid
      end
    end

    context '新規登録できないとき' do
      it "nameが空では登録できない" do
        @owner.name = ''
        @owner.valid?
        expect(@owner.errors.full_message).to include("Name can't be blank")
      end
      it "emailが空では登録できない" do
        @owner.email = ''
        @owner.valid?
        expect(@owner.errors.full_message).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @owner.password = ''
        @owner.valid?
        expect(@owner.errors.full_messages).to include("Password can't be blank")
      end
      it "年齢が空では登録できない" do
        @owner.age = ''
        @owner.valid?
        expect(@owner.errors.full_messages).to include("Age can't be blank")
      end
      it "メールアドレスが一意性でなければ登録できない" do
        @owner.save
        another_owner = FactoryBot.build(:owner)
        another_owner.email = @owner.email
        another_owner.valid?
        expect(another_owner.errors.full_messages).to include("Email has already been taken")
      end
      it "メールアドレスは＠を含まないと登録できない" do
        @owner.email = 'hoge.com'
        @owner.valid?
        expect(@owner.errors.full_messages).to include("Email is invalid")
      end
      it "パスワードが5文字以下では登録できない" do
        @owner.password = '00aaa'
        @owner.valid?
        expect(@owner.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "パスワードとパスワード（確認用）、値の一致していなければ登録できない" do
        @owner.password = '123456'
        @owner.password_confirmation = '12345'
        @owner.valid?
        expect(@owner.errors.full_messages).to include("Password confirmation doesn't match Password")
       end
      it "パスワードが半角、英数混合でなければ登録できない" do 
        @owner.password = 'aaaaaaaa'
        @owner.valid?
        expect(@owner.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "メールアドレスは＠を含まないと登録できない" do
        @owner.email = 'hoge.com'
        @owner.valid?
        expect(@owner.errors.full_messages).to include("Email is invalid")
      end
    end
  end
end
