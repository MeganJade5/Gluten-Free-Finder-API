class Post < ApplicationRecord
  belongs_to :user
  belongs_to :cuisine
  belongs_to :food_prep
  has_rich_text :description
end
