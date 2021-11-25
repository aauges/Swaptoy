class Toy < ApplicationRecord
  has_many :bookings, dependent: :destroy
  validates :name, :description, presence: true
  has_one_attached :image
  scope :baby, -> { where("age < 5") }
  scope :child, -> { where("age > 5") }
  # CATEGORIES = [""]
end
