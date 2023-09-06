class FavouritePostsController < ApplicationController
  skip_before_action :verify_authenticity_token

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
      else
        format.html { redirect_to posts_path }
        format.json
      end
    end
  end

  def destroy
    @favourite_post = FavouritePost.find(params[:id])
    @post = @favourite_post.post
    @favourite_post.destroy
    respond_to do |format|
      format.html { redirect_to posts_path }
      format.json
    end
    # Have left out redirect as not sure where to redirect to yet
  end
end
