class Post < ApplicationRecord
    has_one_attached :image
    belongs_to :owner
    with_options presence: true do
        validates :title
        validates :station
        validates :price
        validates :access
        validates :describe
        validates :image
    end
end