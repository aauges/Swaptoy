class Toy < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  validates :name, :description, presence: true
  has_one_attached :image
  scope :baby, -> { where(age: 0..1) }
  scope :toddler, -> { where(age: 2..3) }
  scope :preschool, -> { where(age: 4..5) }

  def age_category
    if (0..1).include?(age)
      "Baby toys"
    elsif (2..3).include?(age)
      "Toddler toys"
    elsif (4..5).include?(age)
      "Pre-schooler toys"
    end
  end
  # CATEGORIES = [""]
end

# Baby: 0-12 mos.

# Toddler: 1-3 yrs.

# Preschool: 3-5 yrs
