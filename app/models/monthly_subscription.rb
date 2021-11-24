class MonthlySubscription < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :toys
  belongs_to :user, optional: true

  validates :start_date, :end_date, presence: true
  has_and_belongs_to_many :bookings
end
