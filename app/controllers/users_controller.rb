class UsersController < ApplicationController
  def index
    @users = User.includes(:experiences, :educations, :skills, :capstones).all
    render :index
  end

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      profile_image: params[:profile_image],
      species: params[:species],
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    @user.destroy
    redirect_to @user, notice: "user was successfully destroyed."
  end
end
