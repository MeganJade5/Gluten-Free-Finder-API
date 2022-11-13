class PostsController < ApplicationController
    before_action :set_post, only: [:show]
    before_action :authenticate, only: [:create, :updated, :destroy]

    def index
        posts = Post.all.includes(:user, :cuisine, :food_prep)
        render json: posts, include: {cuisine: {only: :name}, food_prep: {only: :name}, user: {only: :email}}, status: 200
    end

    def show
        render json: @post, include: {cuisine: {only: :name}, food_prep: {only: :name}, user: {only: :email}}, status: 200
    end

    def create
        post = current_user.posts.create(post_params)
        unless post.errors.any?
            render json: post, include: {cuisine: {only: :name}, food_prep: {only: :name}, user: {only: :email}}, status: 201
        else
            render json: {errors: post.errors.full_messages}, status: 422
        end
    end

    private

    def set_post
        begin
        @post = Post.find(params[:id])
        rescue
            render json: {error: "Unable to find post"}, status: 404
        end
    end

    def post_params
        params.require(:post).permit(:restaurant_name, :street_number, :street_name, :suburb, :postcode, :description, :cuisine_id, :food_prep_id, :live_status, :image)
    end
end
