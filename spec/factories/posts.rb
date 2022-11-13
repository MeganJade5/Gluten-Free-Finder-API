FactoryBot.define do
  factory :post do
    association :user, factory: :user
    association :cuisine
    association :food_prep
    restaurant_name { "post" }
    street_number { "1A" }
    street_name { "Road" }
    suburb { "Sydney" }
    postcode { 1 }
    description { "testing here" }
    live_status { false }
  end
end
