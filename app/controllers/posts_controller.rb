require cloudinary

class PostsController < ApplicationController
  def create
    user = User.new(
      text: params[:text],
      user_id: params[:user_id],
      image_url: params[:image_url],
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
      Cloudinary::Uploader.upload(:image_url,
                                  use_filename: true)
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end
end
