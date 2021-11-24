class Toy < ApplicationRecord
  has_many :bookings, dependent: :destroy
  validates :name, :description, presence: true
  has_one_attached :image
end
