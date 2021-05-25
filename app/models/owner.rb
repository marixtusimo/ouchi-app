class Owner < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :rooms
  has_many :posts
  validates :name, presence: true # 空では登録不可
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i } # 半角英数字混合
  def self.guest
    find_or_create_by!(email: 'guest2@example.com') do |owner|
      owner.password = SecureRandom.urlsafe_base64
      owner.name = "ゲスト" 
      owner.age = 24
    end
  end
end
