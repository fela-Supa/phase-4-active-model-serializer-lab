class PostsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    posts = Post.all
    render json: posts, include: [:author, :tags]
  end

  def show
    post = Post.find(params[:id])
    render json: post, include: [:author, :tags]
  end

  private

  def render_not_found_response
    render json: { error: "Post not found" }, status: :not_found
  end

end
