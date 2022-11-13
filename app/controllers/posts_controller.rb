class PostsController < ApplicationController
    before_action :set_post, only: [:show]

    def index
        posts = Post.all.includes(:user, :cuisine, :food_prep)
        render json: posts, include: {cuisine: {only: :name}, food_prep: {only: :name}, user: {only: :email}}, status: 200
    end

    def show
        render json: @post, include: {cuisine: {only: :name}, food_prep: {only: :name}, user: {only: :email}}, status: 200
    end

    private

    def set_post
        begin
        @post = Post.find(params[:id])
        rescue
            render json: {error: "Unable to find post"}, status: 404
        end
    end
end
