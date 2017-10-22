class Review < ApplicationRecord
  belongs_to :restaurant
  validates :rating, presence: true
  validates :body, presence: true
  validates :restaurant_id, presence: true
end
