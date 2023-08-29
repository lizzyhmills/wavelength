class FriendshipsController < ApplicationController
  def index
    @users = User.all
    @user = User.find(params[:user_id])
    @myfriends = @user.friendships_as_follower
    @myrequests = @user.friendships_as_followed
  end

  def create
  end

  def destroy
  end
end
