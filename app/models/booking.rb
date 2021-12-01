class Booking < ApplicationRecord
  belongs_to :toy
  belongs_to :monthly_subscription
  has_many :reviews

  # validates :start_date, :end_date, presence: true
end
