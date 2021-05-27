class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :owner
  with_options presence: true do
    validates :title
    validates :station
    validates :price, inclusion: { in: 10000..9_999_999 }, format:{with: /\A[0-9]+\z/}#半角数字のみOK
    validates :access
    validates :describe
    validates :image
  end

  def self.search(search)
    if search != ''
      Post.where('station LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
end
