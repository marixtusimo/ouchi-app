class Message < ApplicationRecord
  belongs_to :room
  has_many :messages
end
