cuisines = ["Australian", "American", "Brazilian", "British", "Caribbean", "Chinese", "Ethiopian", "French", "German", "Greek", "Indian", "Italian", "Japanese", "Korean", "Kosha", "Lebanese", "Mexican", "Philippines", "Spanish", "Thai", "Turkish", "Vietnamese", "Other"]

if Cuisine.count == 0
    cuisines.each do |cuisine|
        Cuisine.create(name: cuisine)
        puts "created with #{cuisine} cuisine"
    end
end

# food_preps = ["Certified GF Kitchen", "Traces of Gluten in food", "Chances of cross-contaminaton"]

# if FoodPrep.count == 0
#     food_preps.each do |food_prep|
#         FoodPrep.create(name: food_prep)
#         puts "created with #{food_prep} food preparation"
#     end
# end

User.first_or_create(email: 'admin@glutenfreefinder.com',
    password: 'admin123',
    password_confirmation: 'admin123',
    role: User.roles[:admin])
