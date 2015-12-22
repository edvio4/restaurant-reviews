class Restaurant < ActiveRecord::Base
  has_many :reviews

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true, uniqueness: { scope: [:city, :state, :zip] }
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true, length: { is: 5, message: "is the wrong length (should be 5 characters)"}, format: { with: /[0-9][0-9]*/, message: "is not a number" }

end
