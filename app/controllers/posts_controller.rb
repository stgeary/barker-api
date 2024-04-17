class PostsController < ApplicationController
  def create
    user = User.new(
      text: params[:text],
      user_id: params[:user_id],
      image_url: params[:image_url],
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end
end
