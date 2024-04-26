require "cloudinary"

class PostsController < ApplicationController
  before_action :authenticate_user, only: [:index, :create]

  def index
    @posts = Post.all
    render :index
  end

  def create
    post = Post.new(
      text: params[:text],
      user_id: params[:user_id],
      image_url: params[:image_url],
    )
    if post.save
      render json: { message: "Post created successfully" }, status: :created
      # Cloudinary::Uploader.upload(:image_url,
      #                             use_filename: true)
    else
      render json: { errors: post.errors.full_messages }, status: :bad_request
    end
  end

  # def destroy
  #   @post = Post.find_by(id: params["id"])
  #   @post.destroy
  #   render json: { message: "Post successfully deleted" }
  # end
end
