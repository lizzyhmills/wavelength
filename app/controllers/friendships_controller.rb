class FriendshipsController < ApplicationController
  def index
    @users = User.where.not(id: current_user.friendships_as_follower.pluck(:followee_id) + [current_user.id])
    # @user = User.find(params[:user_id])
    @user = current_user
    @myfollowers = @user.friendships_as_follower.where(accepted: true)
    @followings = @user.friendships_as_followed.where(accepted: true)
    @myrequests = @user.friendships_as_followed.where(accepted: false || nil)
    @pendings = @user.friendships_as_follower.where(accepted: nil)

  end

  def create
    @user = current_user
    @friend = User.find(params[:user_id])
    @friendship = Friendship.new
    @friendship.follower = @user
    @friendship.followee = @friend
    @friendship.save!
    redirect_to posts_path
  end

  def destroy
  end

  def accept
    @friendship = Friendship.find(params[:id])
    @friendship.update(accepted: true)
    redirect_to friendships_path
  end

  def reject
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    redirect_to friendships_path
  end
end
