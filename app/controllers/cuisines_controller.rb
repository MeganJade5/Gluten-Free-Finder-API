class CuisinesController < ApplicationController
    def index
        cuisines = Cuisine.all
        render json: cuisines, status: 200
    end
end
