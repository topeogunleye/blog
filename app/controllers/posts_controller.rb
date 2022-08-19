class PostsController < ApplicationController
  def index
    @posts = Post.all
    @user = User.posts.includes(:comments, :likes)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end
end
