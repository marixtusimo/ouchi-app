class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :rooms
  with_options presence: true do
     validates :name
     validates :age, inclusion: { in: 20..60 }, format:{with: /\A[0-9]+\z/}#半角数字のみOK
     validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i } # 半角英数字混合
  end
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト" 
      user.age = 24
    end
  end
end
