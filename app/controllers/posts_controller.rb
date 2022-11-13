class PostsController < ApplicationController
    def index
        posts = Post.all.includes(:user, :cuisine, :food_prep)
        render json: posts, include: {cuisine: {only: :name}, food_prep: {only: :name}, user: {only: :email}}, status: 200
    end
end
