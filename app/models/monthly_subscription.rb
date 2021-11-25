class MonthlySubscription < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :toys
  belongs_to :user, optional: true
end
