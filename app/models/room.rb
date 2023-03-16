class Room < ApplicationRecord
  validates :title, :description, presence: true, length: { minimum: 4 }
end
