class FoodPrepsController < ApplicationController
    def index
        food_preps = FoodPrep.all
        render json: food_preps, status: 200
    end
end
