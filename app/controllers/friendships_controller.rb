class FriendshipsController < ApplicationController
  def index
    @users = User.where.not(id: current_user.friendships_as_follower.where(accepted: true).pluck(:followee_id) + [current_user.id])
    # @user = User.find(params[:user_id])
    @user = current_user
    @myfollowers = @user.friendships_as_follower.where(accepted: true)
    @myrequests = @user.friendships_as_followed
  end

  def create
    @user = current_user
    @friend = User.find(params[:user_id])
    @friendship = Friendship.new
    @friendship.follower = @user
    @friendship.followee = @friend
    @friendship.save!
    redirect_to friendships_path
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
    @friendship.update(accepted: false)
    redirect_to friendships_path
  end
end
