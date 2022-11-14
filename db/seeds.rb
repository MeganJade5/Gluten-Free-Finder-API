cuisines = ["Australian", "American", "Brazilian", "British", "Caribbean", "Chinese", "Ethiopian", "French", "German", "Greek", "Indian", "Italian", "Japanese", "Korean", "Kosha", "Lebanese", "Mexican", "Philippines", "Spanish", "Thai", "Turkish", "Vietnamese", "Other"]

if Cuisine.count == 0
    cuisines.each do |cuisine|
        Cuisine.create(name: cuisine)
        puts "created with #{cuisine} cuisine"
    end
end

food_preps = ["Certified GF Kitchen", "Traces of Gluten in food", "Chances of cross-contaminaton"]

if FoodPrep.count == 0
    food_preps.each do |food_prep|
        FoodPrep.create(name: food_prep)
        puts "created with #{food_prep} food preparation"
    end
end

if Post.count == 0
    15.times do
        Post.create!(
            restaurant_name: Faker::Lorem.words(number:3).join(" "),
            street_number: rand(5) + 1,
            street_name: Faker::Lorem.words(number:3).join(" "),
            suburb: Faker::Lorem.words(number:1).join(" "),
            postcode: rand(5) + 1,
            description: Faker::Lorem.paragraph_by_chars(number:20, supplemental: false),
            user_id: 1,
            cuisine_id: rand(2) + 1,
            food_prep_id: rand(2) + 1,
        )
    end
    puts "created posts"
end

if User.count == 0
    User.create(email: "megan@test.com", password: "password1234", password_confirmation: "password1234")
    puts "created user"
end

# User.first_or_create(email: 'admin@glutenfreefinder.com',
#     password: 'admin123',
#     password_confirmation: 'admin123',
#     role: User.roles[:admin])
