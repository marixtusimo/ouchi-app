class Room < ApplicationRecord
  belongs_to :user
  belongs_to :owner
  has_many :messages
end
