require 'rails_helper'

RSpec.describe "物件投稿", type: :system do
  before do
    @owner = FactoryBot.create(:owner)
    @post = FactoryBot.build(:post)
  end

  context '投稿できるとき' do
    it 'ログインしたオーナーは投稿できる' do
      visit new_owner_session_path
      fill_in 'E-Mail', with: @owner.email
      fill_in 'PassWord（半角英数混合6文字以上）', with: @owner.password
      find('input[type="submit"]').click
      expect(current_path).to eq(root_path)
      expect(page).to have_content('Post It')
      visit new_post_path
      fill_in '例）〇〇マンション109号室' , with: @post.title
      fill_in '例）軽井沢駅' , with: @post.station
      fill_in '例）30000' , with: @post.price
      fill_in '例）徒歩３分' , with: @post.access
      fill_in '例）物件の特徴など' , with: @post.describe
      image_path = Rails.root.join('public/images/sample1.png')
      attach_file('post[image]', image_path, make_visible: true)
      expect{
        find('input[type="submit"]').click
      }.to change { Post.count }.by(1)
      visit root_path
    end
  end

  context '投稿できないとき' do
    it 'ログインしていないと投稿ページへ遷移できない' do
      visit root_path
      expect(page).to have_no_content('Post It')
    end
  end
end