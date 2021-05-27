require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '物件投稿機能' do
    context '物件登録できないとき' do
      it 'titleが空では登録できない' do
        @post.title = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Title can't be blank")
      end
      it 'stationが空では登録できない' do
        @post.station = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Station can't be blank")
      end
      it 'priceが空では登録できない' do
        @post.price = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Price can't be blank")
      end
      it 'accessが空では登録できない' do
        @post.access = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Access can't be blank")
      end
      it 'describeが空では登録できない' do
        @post.describe = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Describe can't be blank")
      end
      it 'imageが空では登録できない' do
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Image can't be blank")
      end
      it 'priceが全角では登録できない' do
        @post.price = '２０００００'
        @post.valid?
        expect(@post.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが10000以下では登録できない' do
        @post.price = '9999'
        @post.valid?
        expect(@post.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが9_999_999以上では登録できない' do
        @post.price = '99999999'
        @post.valid?
        expect(@post.errors.full_messages).to include('Price is not included in the list')
      end
    end
  end
end
