class PostsController < ApplicationController
    before_action :set_post, only: [:show, :update, :destroy]
    before_action :authenticate, only: [:create, :updated, :destroy]
    before_action :authorize, only: [:update, :destroy]

def index
    posts = Post.where(live_status: true)
    posts = posts.map do |post|
        post_hash = post.attributes
        post_hash[:cuisine] = post.cuisine.name
        post_hash[:food_prep] = post.food_prep.name
        post_hash[:user] = post.user.email
        post_hash[:image_path] = url_for(post.image) if post.image.attached?
        post_hash
      end
  
      render json: { posts: posts }, status: 200        
end

    def show
        render_post(@post)
    end

    def create
        post = current_user.posts.create(post_params)
        render_post(post, 201)
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
        params.permit(:restaurant_name, :street_number, :street_name, :suburb, :postcode, :description, :cuisine_id, :food_prep_id, :live_status, :image)
    end

    # change this to admin
    def authorize
        render json: {error: "You don't have permission to do that"}, status: 401 unless current_user.id == @post.user_id
    end

    def render_post(post, status=200)
        unless post.errors.any?
        post_hash = post.attributes
        post_hash[:cuisine] = post.cuisine.name
        post_hash[:food_prep] = post.food_prep.name
        post_hash[:user] = post.user.email
        post_hash[:image_path] = url_for(post.image) if post.image.attached?
            render json: post_hash, status:status
        else
            render json: {errors: post.errors.full_messages}, status: 422
        end
    end
end
