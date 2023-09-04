class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @userpost = @user.posts.where(post_date: Date.today).first
    if params[:query].present?
      @posts = Post.where(user: @user).search_by_artist_and_song(params[:query])
    else
      @posts = @user.posts
    end
    if params[:query_favourites].present?
      @posts_ids = @user.favourite_posts.pluck(:post_id)
      @favourite_posts = Post.where(id: @posts_ids).search_by_artist_and_song(params[:query_favourites])
    else
      @posts_ids = @user.favourite_posts.pluck(:post_id)
      @favourite_posts = Post.where(id: @posts_ids)
    end
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
