class FavouritePostsController < ApplicationController
  def create
    @favourite_post = FavouritePost.new
    @user = current_user
    @post = Post.find(params[:post_id])
    @favourite_post.post = @post
    @favourite_post.user = @user

    respond_to do |format|
      if @favourite_post.save
        format.html { redirect_to posts_path }
        format.json # Follow rails convention and go to create.json
      end
    end
  end

  def destroy
    @favourite_post = FavouritePost.find(params[:id])
    @favourite_post.destroy
    redirect_to posts_path
    # Have left out redirect as not sure where to redirect to yet
  end
end
