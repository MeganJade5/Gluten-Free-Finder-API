class Post < ApplicationRecord
  belongs_to :user
  belongs_to :cuisine
  belongs_to :food_prep
  validates :restaurant_name, presence: true
  validates :street_number, presence: true
  validates :street_name, presence: true
  validates :suburb, presence: true
  validates :postcode, presence: true
  validates :description, presence: true
end
