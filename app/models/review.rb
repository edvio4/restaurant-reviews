class Review < ActiveRecord::Base
  belongs_to :restaurant

  validates :body, presence: true
  validates :rating, presence: true, numericality: { only_iteger: true }, format: { with: /[1-5]/, message: "Must be between 1 - 5" }
  validates :restaurant_id, presence: true
end
