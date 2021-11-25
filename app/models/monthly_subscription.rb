class MonthlySubscription < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :toys, through: :bookings
  belongs_to :user, optional: true

  # validates :start_date, :end_date, presence: true
end
