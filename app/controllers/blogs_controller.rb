class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end
end
