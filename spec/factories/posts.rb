FactoryBot.define do
  factory :post do
    restaurant_name { "MyString" }
    street_number { "MyString" }
    street_name { "MyString" }
    suburb { "MyString" }
    postcode { 1 }
    description { nil }
    user { nil }
    cuisine { nil }
    food_prep { nil }
    live_status { false }
  end
end
