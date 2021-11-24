class Booking < ApplicationRecord
  belongs_to :toy
  has_and_belongs_to_many :monthly_subscription

  # validates :start_date, :end_date, presence: true
end
