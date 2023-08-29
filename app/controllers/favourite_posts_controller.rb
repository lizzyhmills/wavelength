class FavouritePostsController < ApplicationController
  def create
    @favourite_post = FavouritePost.new
    @user = current_user
    @post = Post.find(params[:id])
    @favourite_post.post = @post
    @favourite_post.user = @user
    if @favourite_post.save!
      redirect_to posts_path
    else
      render :posts_path, status: :unprocessable_entity
    end
  end

  def destroy
    @favourite_post = FavouritePost.find(params[:id])
    @favourite_post.destroy
    # Have left out redirect as not sure where to redirect to yet
  end
end
