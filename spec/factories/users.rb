FactoryBot.define do
  factory :user do
    email { "test@test.com" }
    password { "password123" }
    password_confirmation {"password123"}
    restaurant_owner_accepted { false }
  end
end
