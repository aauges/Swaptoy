class MonthlySubscription < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_many :toys, through: :bookings
  belongs_to :user, optional: true
  monetize :price_cents

  # validates :start_date, :end_date, presence: true
end
