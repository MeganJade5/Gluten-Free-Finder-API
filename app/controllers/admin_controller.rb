class AdminController < ApplicationController
  before_action :is_admin?

  def index
  end

  def posts
  end

  def show_post
  end

  private

  def is_admin?
    redirect_to root_path unless current_user.admin?
end
