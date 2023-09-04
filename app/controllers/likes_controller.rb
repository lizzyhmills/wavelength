class LikesController < ApplicationController

  def create
    @like = Like.new
    @user = current_user
    @post = Post.find(params[:post_id])
    @like.post = @post
    @like.user = @user

    respond_to do |format|
      if @like.save
        format.html { redirect_to posts_path }
        format.json # Follow rails convention and go to create.json
      end
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to posts_path
  end
end
