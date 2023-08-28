class PostsController < ApplicationController
  def index
    @user = current_user
    @posts = Post.where(user_id: @user.friendships_as_follower.map { |friend| friend.followee.id })
    @myposts = Post.where(user_id: @user.id)

  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = Post.new(post_params)
    @post.user = @user
    if @post.save!
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:song_name, :content)
  end
end
