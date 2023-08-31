class LikesController < ApplicationController
  def create
    @like = Like.new
    @user = current_user
    @post = Post.find(params[:post_id])
    @like.post = @post
    @like.user = @user
    @like.save
    redirect_to posts_path
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to posts_path
  end
end
