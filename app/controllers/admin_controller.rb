class AdminController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]
  before_action :authorize, only: [:show, :update, :destroy]

  def index
    posts = Post.where(live_status: false)
    render json: posts, include: {cuisine: {only: :name}, food_prep: {only: :name}, user: {only: :email}}, status: 200
  end

  def posts
    render json: @post, include: {cuisine: {only: :name}, food_prep: {only: :name}, user: {only: :email}}, status: 200
  end

  def show_post
  end

  private

    def authorize
        render json: {error: "You don't have permission to do that"}, status: 401 unless current_user.admin?
    end

  def set_post
      begin
      @post = Post.find(params[:id])
      rescue
          render json: {error: "Unable to find post"}, status: 404
      end
  end

end
