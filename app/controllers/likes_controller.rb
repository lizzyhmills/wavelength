class LikesController < ApplicationController
  def create
    @like = Like.new
    @user = current_user
    @post = Post.find(params[:id])
    @like.post = @post
    @like.user = @user
    @like.save
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
  end
end
