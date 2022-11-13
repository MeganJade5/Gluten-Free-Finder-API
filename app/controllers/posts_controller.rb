class PostsController < ApplicationController
    before_action :set_post, only: [:show, :update, :destroy]
    before_action :authenticate, only: [:create, :updated, :destroy]
    before_action :authorize, only: [:update, :destroy]

    def index
        posts = Post.all.includes(:user, :cuisine, :food_prep)
        render json: posts, include: {cuisine: {only: :name}, food_prep: {only: :name}, user: {only: :email}}, status: 200
    end

    def show
        render json: @post, include: {cuisine: {only: :name}, food_prep: {only: :name}, user: {only: :email}}, status: 200
    end

    def create
        post = current_user.posts.create(post_params)
        render_post(post)
    end

    def update
        @post.update(post_params)
        render_post(post)
    end

    def destroy
        attributes = @post.attributes
        @post.destroy
        render json: attributes, status: 202
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

    # change this to admin
    def authorize
        render json: {error: "You don't have permission to do that"}, status: 401 unless current_user.id == @post.user_id
    end

    def render_post(post)
        unless post.errors.any?
            render json: post, include: {cuisine: {only: :name}, food_prep: {only: :name}, user: {only: :email}}, status: 201
        else
            render json: {errors: post.errors.full_messages}, status: 422
        end
    end
end
