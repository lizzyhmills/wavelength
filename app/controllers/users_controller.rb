class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @favourite_posts = @user.favourite_posts
    # @favourite_posts = Post.where(user_id: @user.id)
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user
      redirect_to user_path(@user)
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:bio, :avatar_url, :first_name, :last_name, :photo)
  end
end
